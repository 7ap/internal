#include <iostream>
#include <thread>

#include "state.hpp"

static State g_state;
State &state = g_state;

void thread() {
    std::cout << "Hello, world!" << std::endl;
}

void attach() {
    state.thread = new std::thread(thread);
}

void detach() {
    state.thread->detach();
}

void __attribute__((constructor)) attach();
void __attribute__((destructor)) detach();
