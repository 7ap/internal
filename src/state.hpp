#pragma once

#include <thread>

struct State {
    std::thread *thread;
};

extern State &state;

