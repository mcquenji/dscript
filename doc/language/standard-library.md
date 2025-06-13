# Standard Library

The analyzer knows about a few built‑in namespaces. Only a subset of functions are currently operational:

## `math::`
Basic numeric helpers like `math::sqrt`, `math::floor` and `math::abs`.

## `string::`
Functions for string conversion and manipulation such as `string::from` and `string::length`.

## `log::`
Logging helpers: `log::info`, `log::warning` and `log::error` simply print to the host console.

## Not Yet Implemented

The `fs::` and `http::` namespaces are defined in the grammar but are not yet implemented. Calls to these functions will raise analysis errors or runtime errors until support is added.
