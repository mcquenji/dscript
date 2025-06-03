# Dscript Overview

Dscript is a small scripting language intended for plug‑in style extensions in Dart applications. At the moment the package ships with a parser and static analyzer. A runtime engine is planned but not yet available.

This guide covers the language syntax and how to integrate scripts with a Dart host. Sections marked as **Work in Progress** describe features that are not implemented in the current version.

```mermaid
---
title: Architecture Overview
---
flowchart-elk TD
    Host[Host Application]
    Contracts[Contract Signatures]
    Analyzer[Analyzer]
    Scripts["Dscript Scripts"]
    Stdlib["Standard Libraries (math, string, log)"]
    External[External Bindings]
    Permissions["Declared Permissions"]
    Runtime["Runtime (planned)"]

    Host -->|defines| Contracts
    Contracts --> Analyzer
    Contracts -->|registers| External
    Scripts -->|implement| Contracts
    Analyzer -->|validates| Scripts
    Scripts -->|use| Stdlib
    Scripts -->|declare| Permissions
    External -->|requires| Permissions
    Scripts -->|call| External
    Runtime -.->|enforces permissions and executes scripts| Scripts
    Runtime -.->|granted by host| Permissions
    Host --> Runtime

```
