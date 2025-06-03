# Dscript

**Table of Contents**

- [Language Reference](language-ref/introduction.md)  
- [Contracts & Dart](contracts-dart/defining-contracts.md)

Welcome to the documentation for **Dscript**, a small DSL (Domain-Specific Language) designed to let you write “plugin” scripts that integrate seamlessly with a Dart/Flutter host.  
Here you’ll find:

- **Using the Language**: How to write `.dscript` files, DSL syntax, built-in types, and examples.
- **Contracts & Dart**: How to define a contract in Dart, load and run a script at runtime, and bind host functions.

> If you’re already comfortable with the language, jump to [Defining Contracts](contracts-dart/defining-contracts.md) to learn how to bridge your Dart code to Dscript.  
> Otherwise, start at [Introduction](language-ref/introduction.md).

## Architecture Overview

```mermaid
flowchart TD
  %% Host Initialization and Static Analysis
  HostStart[Host Startup] --> LoadScript[Load Plugin Script]
  LoadScript --> ParseScript[Parse Script and Generate AST]
  ParseScript --> StaticPerm[Static Permission Check]
  StaticPerm --> TypeCheck[Type Checking and Contract Validation]
  TypeCheck --> Register[Register Hooks and Implementations]

  %% Runtime Loop
  Register --> RuntimeLoop{Runtime Loop Running}

  %% Event Emission
  RuntimeLoop --> EventEmitted["Event Emitted (e.g. onLogin)"]
  EventEmitted --> FindHooks[Find Listening Hooks]
  FindHooks --> PreHookCheck[Check Runtime Permissions]
  PreHookCheck --> ExecuteHook[Execute Hook Implementation]

  %% Hook Execution and Potential Impl Call
  ExecuteHook --> NeedsService{Does Hook Call Impl?}
  NeedsService -->|Yes| PreImplCheck[Check Runtime Permissions]
  NeedsService -->|No| ContinueHook[Continue Hook Logic]

  %% Impl Execution and Dart Interop
  PreImplCheck --> CallImpl["Invoke Plugin impl(name, args)"]
  CallImpl --> ImplExec[Plugin impl Executes]
  ImplExec --> DartInterop[Dart Interop: std lib or host binding, e.g. fs::read, http::client, external::get_user_info]
  DartInterop --> ImplReturn[Return Data to Hook]

  %% Continue & Finish Event Handling
  ImplReturn --> ContinueHook
  ContinueHook --> EndEvent[Finish Event Handling]
  EndEvent --> RuntimeLoop

  %% Direct Plugin Impl Calls Outside Events
  RuntimeLoop --> DirectCall[Direct Call to Plugin impl]
  DirectCall --> PreImplCheck

  %% Security Model Subgraph
  subgraph Security_Model ["Security Model"]
    DeclaredPerm[Permissions Declared in Script] --> StaticPerm
    StaticPerm --> RuntimeEnforce[Runtime Permission Enforcement]
    PreHookCheck --> RuntimeEnforce
    PreImplCheck --> RuntimeEnforce
  end

  %% Dart Interop Subgraph
  subgraph Dart_Interop ["Dart Interop"]
    DartInterop --> StdLib[Standard Library Functions]
    DartInterop --> HostBind["Host Bindings (external::<function>)"]
  end

  style HostStart fill:#E3F2FD,stroke:#90CAF9
  style LoadScript fill:#E3F2FD,stroke:#90CAF9
  style ParseScript fill:#FFF9C4,stroke:#FFF176
  style StaticPerm fill:#FFCDD2,stroke:#EF9A9A
  style TypeCheck fill:#FFF9C4,stroke:#FFF176
  style Register fill:#C8E6C9,stroke:#A5D6A7
  style RuntimeLoop fill:#FFECB3,stroke:#FFD54F
  style EventEmitted fill:#FFE0B2,stroke:#FFCC80
  style FindHooks fill:#FFE0B2,stroke:#FFCC80
  style PreHookCheck fill:#D1C4E9,stroke:#9575CD
  style ExecuteHook fill:#FFCCBC,stroke:#FF8A65
  style NeedsService fill:#D1C4E9,stroke:#9575CD
  style PreImplCheck fill:#D1C4E9,stroke:#9575CD
  style CallImpl fill:#B3E5FC,stroke:#4FC3F7
  style ImplExec fill:#B2DFDB,stroke:#4DB6AC
  style DartInterop fill:#E1BEE7,stroke:#CE93D8
  style ImplReturn fill:#DCEDC8,stroke:#8BC34A
  style ContinueHook fill:#FFF9C4,stroke:#FFF176
  style EndEvent fill:#FFCDD2,stroke:#E57373
  style DirectCall fill:#E1BEE7,stroke:#CE93D8
  style DeclaredPerm fill:#FFEBEE,stroke:#E57373
  style RuntimeEnforce fill:#FFEBEE,stroke:#E57373
  style StdLib fill:#E1BEE7,stroke:#CE93D8
  style HostBind fill:#E1BEE7,stroke:#CE93D8
  style Security_Model fill:#FFEBEE,stroke:#E57373,stroke-dasharray:5 5
  style Dart_Interop fill:#E8EAF6,stroke:#3F51B5,stroke-dasharray:5 5

```

### Initialization & Static Analysis

1. **Host Startup**

   - Host initializes its plugin subsystem.

2. **Load & Parse Script**

   - Reads the `.dscript` file and parses it into an AST containing contracts, functions, hooks, and permissions.

3. **Static Permission Check**

   - Extracts declared permissions (e.g., `fs::read`, `http::client`, `external::get_user_info`) and verifies them against the host’s allowlist. Unauthorized requests abort loading.

4. **Type & Contract Validation**

   - Verifies each `impl` matches its contract’s signature (return type and arguments) and that hooks return `void` with correct parameters. Mismatches cause load failures.

5. **Register Hooks & Implementations**

   - Stores mappings from event names to hook functions (e.g., `onLogin`) and function names to implementations (`randomNumber`, `randomString`), enabling fast lookup at runtime.

### Runtime Loop

Once loaded, the host enters its main loop, handling events or direct calls:

1. **Event Handling**

   - **Emit Event**: When an event occurs (e.g., user login), the host creates an event object and identifies registered hooks.
   - **Pre-Hook Permission Check**: Ensures the plugin still has required runtime permissions for that event.
   - **Execute Hook**: Invokes the plugin’s hook (e.g., `onLogin(username)`). If the hook calls other `impl` functions, control passes to implementation execution.
   - **Finish**: After hook (and any nested calls) completes, control returns to the loop.

2. **Direct Calls**

   - Host code can call a plugin’s `impl` function directly (e.g., `randomNumber(42)`), triggering a runtime permission check before execution.

### Security Model

Combines static declarations with runtime enforcement:

1. **Declared Permissions**

   - Plugins list needed permissions (e.g., `fs::read, fs::write, http::client`), informing both static and runtime checks.

2. **Static Check**

   - Occurs during loading: any undeclared or disallowed permission halts the process.

3. **Runtime Enforcement**

   - Before executing hooks (`PreHookCheck`) or implementations (`PreImplCheck`), the host revalidates permissions in context (e.g., sandboxing file paths). Unauthorized operations are blocked.

This dual approach prevents unauthorized or malicious actions.

### Dart Interop

Plugins rely on two categories of Dart-bound operations:

1. **Standard Library Calls**

   - DSL mirrors core Dart features:

     - **Math**: `math::pi`, `math::sqrt()`
     - **File System**: `fs::read(path)`, `fs::write(path, data)`
     - **Networking**: `http::client.get(url)`, `http::server.listen(port)`
   - Each call translates into a Dart function call and returns results.

2. **Host Bindings (`external::<function>`)**

   - Custom host functionality (e.g., `external::get_user_info()`, logging, database access) is exposed via the `external` namespace and resolved at runtime through Dart methods or platform channels.

3. **Implementation Flow**

   - When an `impl` runs, any standard-lib or host-binding call crosses into Dart, executes, and returns results back to the plugin.

This system grants full Dart capabilities to plugins, subject to declared permissions.

### Summary Flow

1. **Startup & Analysis**: Host starts → load script → parse AST → static permission check → validate contracts → register hooks and impls.
2. **Runtime Loop**:

   - **Event Path**: Event → find hooks → pre-hook check → execute hook → (optional) `impl` → pre-impl check → Dart interop → return → finish.
   - **Direct Call Path**: Host calls `impl` → pre-impl check → Dart interop → return.
3. **Security Model**: Static declarations guide runtime checks; file, network, and host-binding calls are enforced dynamically.
4. **Dart Interop**: All DSL operations map to Dart calls, ensuring plugins can use Dart features within permission boundaries.

By following this design, Dscript plugins achieve type safety, contract enforcement, security, and seamless Dart integration.
