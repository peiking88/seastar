Seastar
=======

[![Test](https://github.com/scylladb/seastar/actions/workflows/tests.yaml/badge.svg)](https://github.com/scylladb/seastar/actions/workflows/tests.yaml)
[![Version](https://img.shields.io/github/tag/scylladb/seastar.svg?label=version&colorB=green)](https://github.com/scylladb/seastar/releases)
[![License: Apache2](https://img.shields.io/github/license/scylladb/seastar.svg)](https://github.com/scylladb/seastar/blob/master/LICENSE)
[![n00b issues](https://img.shields.io/github/issues/scylladb/seastar/n00b.svg?colorB=green)](https://github.com/scylladb/seastar/labels/n00b)

Introduction
------------

SeaStar is an event-driven framework allowing you to write non-blocking,
asynchronous code in a relatively straightforward manner (once understood).
It is based on [futures](http://en.wikipedia.org/wiki/Futures_and_promises).
[![zread](https://img.shields.io/badge/Ask_Zread-_.svg?style=flat&color=00b0aa&labelColor=000000&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuOTYxNTYgMS42MDAxSDIuMjQxNTZDMS44ODgxIDEuNjAwMSAxLjYwMTU2IDEuODg2NjQgMS42MDE1NiAyLjI0MDFWNC45NjAxQzEuNjAxNTYgNS4zMTM1NiAxLjg4ODEgNS42MDAxIDIuMjQxNTYgNS42MDAxSDQuOTYxNTZDNS4zMTUwMiA1LjYwMDEgNS42MDE1NiA1LjMxMzU2IDUuNjAxNTYgNC45NjAxVjIuMjQwMUM1LjYwMTU2IDEuODg2NjQgNS4zMTUwMiAxLjYwMDEgNC45NjE1NiAxLjYwMDFaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00Ljk2MTU2IDEwLjM5OTlIMi4yNDE1NkMxLjg4ODEgMTAuMzk5OSAxLjYwMTU2IDEwLjY4NjQgMS42MDE1NiAxMS4wMzk5VjEzLjc1OTlDMS42MDE1NiAxNC4xMTM0IDEuODg4MSAxNC4zOTk5IDIuMjQxNTYgMTQuMzk5OUg0Ljk2MTU2QzUuMzE1MDIgMTQuMzk5OSA1LjYwMTU2IDE0LjExMzQgNS42MDE1NiAxMy43NTk5VjExLjAzOTlDNS42MDE1NiAxMC42ODY0IDUuMzE1MDIgMTAuMzk5OSA0Ljk2MTU2IDEwLjM5OTlaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik0xMy43NTg0IDEuNjAwMUgxMS4wMzg0QzEwLjY4NSAxLjYwMDEgMTAuMzk4NCAxLjg4NjY0IDEwLjM5ODQgMi4yNDAxVjQuOTYwMUMxMC4zOTg0IDUuMzEzNTYgMTAuNjg1IDUuNjAwMSAxMS4wMzg0IDUuNjAwMUgxMy43NTg0QzE0LjExMTkgNS42MDAxIDE0LjM5ODQgNS4zMTM1NiAxNC4zOTg0IDQuOTYwMVYyLjI0MDFDMTQuMzk4NCAxLjg4NjY0IDE0LjExMTkgMS42MDAxIDEzLjc1ODQgMS42MDAxWiIgZmlsbD0iI2ZmZiIvPgo8cGF0aCBkPSJNNCAxMkwxMiA0TDQgMTJaIiBmaWxsPSIjZmZmIi8%2BCjxwYXRoIGQ9Ik00IDEyTDEyIDQiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K&logoColor=ffffff)](https://zread.ai/supabase/supabase)

Building Seastar
--------------------

For more details and alternative work-flows, read [HACKING.md](./HACKING.md).

Assuming that you would like to use system packages (RPMs or DEBs) for Seastar's dependencies, first install them:

```
$ sudo ./install-dependencies.sh
```

then configure (in "release" mode):

```
$ ./configure.py --mode=release
```
then compile:

```
$ ninja -C build/release
```

In case there are compilation issues, especially like ```g++: internal compiler error: Killed (program cc1plus)```
try giving more memory to gcc, either by limiting the amount of threads ( -j1 ) and/or allowing at least 4g ram to your
machine.

If you're missing a dependency of Seastar, then it is possible to have the configuration process fetch a version of the dependency locally for development.

For example, to fetch `fmt` locally, configure Seastar like this:

```
$ ./configure.py --mode=dev --cook fmt
```

`--cook` can be repeated many times for selecting multiple dependencies.


Build modes
----------------------------------------------------------------------------

The configure.py script is a wrapper around cmake. The --mode argument
maps to CMAKE_BUILD_TYPE, and supports the following modes

|          | CMake mode          | Debug info | Optimi&shy;zations | Sanitizers   | Allocator | Checks   | Use for                                |
| -------- | ------------------- | ---------- | ------------------ |------------- | --------- | -------- | -------------------------------------- |
| debug    | `Debug`             | Yes        | `-O0`              | ASAN, UBSAN  | System    | All      | gdb                                    |
| release  | `RelWithDebInfo`    | Yes        | `-O3`              | None         | Seastar   | Asserts  | production                             |
| dev      | `Dev` (Custom)      | No         | `-O1`              | None         | Seastar   | Asserts  | build and test cycle                   |
| sanitize | `Sanitize` (Custom) | Yes        | `-Os`              | ASAN, UBSAN  | System    | All      | second level of tests, track down bugs |

Note that seastar is more sensitive to allocators and optimizations than
usual. A quick rule of the thumb of the relative performances is that
release is 2 times faster than dev, 150 times faster than sanitize and
300 times faster than debug.

Using Seastar from its build directory (without installation)
----------------------------------------------------------------------------

It's possible to consume Seastar directly from its build directory with CMake or `pkg-config`.

We'll assume that the Seastar repository is located in a directory at `$seastar_dir`.


Via `pkg-config`:

```
$ g++ my_app.cc $(pkg-config --libs --cflags --static $seastar_dir/build/release/seastar.pc) -o my_app
```

and with CMake using the `Seastar` package:


`CMakeLists.txt` for `my_app`:

```
set (CMAKE_CXX_STANDARD 23)

find_package (Seastar REQUIRED)

add_executable (my_app
  my_app.cc)

target_link_libraries (my_app
  Seastar::seastar)
```

```
$ mkdir $my_app_dir/build
$ cd $my_app_dir/build
$ cmake -DCMAKE_PREFIX_PATH="$seastar_dir/build/release;$seastar_dir/build/release/_cooking/installed" -DCMAKE_MODULE_PATH=$seastar_dir/cmake $my_app_dir
```

The `CMAKE_PREFIX_PATH` values ensure that CMake can locate Seastar and its compiled submodules. The `CMAKE_MODULE_PATH` value ensures that CMake can uses Seastar's CMake scripts for locating its dependencies.

Using an installed Seastar
--------------------------------

You can also consume Seastar after it has been installed to the file-system.

**Important:**

- Seastar works with a customized version of DPDK, so by default builds and installs the DPDK submodule to `$build_dir/_cooking/installed`

First, configure the installation path:

```
$ ./configure.py --mode=release --prefix=/usr/local
```

then run the `install` target:

```
$ ninja -C build/release install
```

then consume it from `pkg-config`:

```
$ g++ my_app.cc $(pkg-config --libs --cflags --static seastar) -o my_app
```

or consume it with the same `CMakeLists.txt` as before but with a simpler CMake invocation:

```
$ cmake ..
```

(If Seastar has not been installed to a "standard" location like `/usr` or `/usr/local`, then you can invoke CMake with `-DCMAKE_PREFIX_PATH=$my_install_root`.)

There are also instructions for building on any host that supports [Docker](doc/building-docker.md).

Use of the [DPDK](http://dpdk.org) is [optional](doc/building-dpdk.md).

#### Seastar's C++ standard: C++20 or C++23

Seastar supports both C++20, and C++23. The build defaults to the latest
standard supported by your compiler, but can be explicitly selected with
the `--c++-standard` configure option, e.g., `--c++-standard=20`,
or if using CMake directly, by setting on the `CMAKE_CXX_STANDARD` CMake
variable.

See the [compatibity statement](doc/compatibility.md) for more information.

Getting started
---------------

There is a [mini tutorial](doc/mini-tutorial.md) and a [more comprehensive one](doc/tutorial.md).

The documentation is available on the [web](http://docs.seastar.io/master/index.html).


Resources
---------

* Seasatar Development Mailing List: Discuss challenges, propose improvements with
  sending code contributions (patches), and get help from experienced developers.
  Subscribe or browse archives: [here](https://groups.google.com/forum/#!forum/seastar-dev)
  (or email seastar-dev@googlegroups.com).
* GitHub Discussions: For more casual conversations and quick questions, consider
  using the Seastar project's [discussions on Github](https://github.com/scylladb/seastar/discussions).
* Issue Tracker: File bug reports on the project's [issue tracker](https://github.com/scylladb/seastar/issues).

Learn more about Seastar on the main [project website](http://seastar.io).

The Native TCP/IP Stack
-----------------------

Seastar comes with its own [userspace TCP/IP stack](doc/native-stack.md) for better performance.

Recommended hardware configuration for SeaStar
----------------------------------------------

* CPUs - As much as you need. SeaStar is highly friendly for multi-core and NUMA
* NICs - As fast as possible, we recommend 10G or 40G cards. It's possible to use
       1G too but you may be limited by their capacity.
       In addition, the more hardware queue per cpu the better for SeaStar.
       Otherwise we have to emulate that in software.
* Disks - Fast SSDs with high number of IOPS.
* Client machines - Usually a single client machine can't load our servers.
       Both memaslap (memcached) and WRK (httpd) cannot over load their matching
       server counter parts. We recommend running the client on different machine
       than the servers and use several of them.

Projects using Seastar
----------------------------------------------

* [cpv-cql-driver](https://github.com/cpv-project/cpv-cql-driver): C++ driver for Cassandra/Scylla based on seastar framework
* [cpv-framework](https://github.com/cpv-project/cpv-framework): A web framework written in c++ based on seastar framework
* [redpanda](https://vectorized.io/): A Kafka replacement for mission critical systems
* [Scylla](https://github.com/scylladb/scylla): A fast and reliable NoSQL data store compatible with Cassandra and DynamoDB
* [smf](https://github.com/smfrpc/smf): The fastest RPC in the West
* [Ceph - Crimson](https://github.com/ceph/ceph): Next-generation OSD (Object Storage Daemon) implementation based on the Seastar framework
