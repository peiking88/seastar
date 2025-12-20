# CMake generated Testfile for 
# Source directory: /home/li/seastar/apps/memcached/tests
# Build directory: /home/li/seastar/build/apps/memcached/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Seastar.app.memcached.memcached "/usr/bin/cmake" "--build" "/home/li/seastar/build" "--target" "app_memcached_test_memcached_run")
set_tests_properties(Seastar.app.memcached.memcached PROPERTIES  ENVIRONMENT "ASAN_OPTIONS=disable_coredump=0:abort_on_error=1:detect_stack_use_after_return=1;UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1;BOOST_TEST_CATCH_SYSTEM_ERRORS=no" TIMEOUT "300" _BACKTRACE_TRIPLES "/home/li/seastar/apps/memcached/tests/CMakeLists.txt;37;add_test;/home/li/seastar/apps/memcached/tests/CMakeLists.txt;0;")
add_test(Seastar.app.memcached.ascii "/usr/bin/cmake" "--build" "/home/li/seastar/build" "--target" "app_memcached_test_ascii_run")
set_tests_properties(Seastar.app.memcached.ascii PROPERTIES  ENVIRONMENT "ASAN_OPTIONS=disable_coredump=0:abort_on_error=1:detect_stack_use_after_return=1;UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1;BOOST_TEST_CATCH_SYSTEM_ERRORS=no" TIMEOUT "300" _BACKTRACE_TRIPLES "/home/li/seastar/apps/memcached/tests/CMakeLists.txt;70;add_test;/home/li/seastar/apps/memcached/tests/CMakeLists.txt;0;")
