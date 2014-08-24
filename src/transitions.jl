# Before event
function before_event(fsm::StateMachine, state::String, from::String, to::String)
    before_this_event(fsm, state, from, to)
    before_any_event(fsm, state, from, to)
end

function before_this_event(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onbefore" * state
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

function before_any_event(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onbeforeevent"
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

# After event
function after_event(fsm::StateMachine, state::String, from::String, to::String)
    after_this_event(fsm, state, from, to)
    after_any_event(fsm, state, from, to)
end

function after_this_event(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onafter" * state
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

function after_any_event(fsm::StateMachine, state::String, from::String, to::String)
    if haskey(fsm.events, "onafterevent")
        fname = "onafterevent"
    elseif haskey(fsm.events, "onevent")
        fname = "onevent"
    else
        return
    end
    fsm.events[fname](fsm, state, from, to)
end

# Change of state
function change_state(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onchangestate"
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

# Entering a state
function enter_state(fsm::StateMachine, state::String, from::String, to::String)
    enter_this_state(fsm, state, from, to)
    enter_any_state(fsm, state, from, to)
end

function enter_this_state(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onenter" * to
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

function enter_any_state(fsm::StateMachine, state::String, from::String, to::String)
    if haskey(fsm.events, "onenterstate")
        fname = "onenterstate"
    elseif haskey(fsm.events, "onstate")
        fname = "onstate"
    else
        return
    end
    fsm.events[fname](fsm, state, from, to)
end

# Leaving a state
function leave_state(fsm::StateMachine, state::String, from::String, to::String)
    leave_this_state(fsm, state, from, to)
    leave_any_state(fsm, state, from, to)
end

function leave_this_state(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onleave" * from
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end

function leave_any_state(fsm::StateMachine, state::String, from::String, to::String)
    fname = "onleavestate"
    if haskey(fsm.events, fname)
        fsm.events[fname](fsm, state, from, to)
    end
end
