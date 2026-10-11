# FSM State and Data Flow

## 1. State Transition Flow

The FSM has four states:

- **IDLE (00):** Waits for the `start` signal.
- **LOAD (01):** Loads `data_in` into `data_out`.
- **PROCESS (10):** Increments `data_out` by one.
- **DONE (11):** Asserts `done` for one clock cycle and returns to IDLE.

## 2. State Transition Diagram

```text
IDLE --start=1--> LOAD --> PROCESS --> DONE --> IDLE
```

## 3. Datapath Operation

For `data_in = 5`:

1. LOAD: `data_out = 5`
2. PROCESS: `data_out = 6`
3. DONE: `done = 1` for one clock cycle.
4. IDLE: The FSM waits for the next transaction.

The datapath uses a 4-bit register, so values wrap around after 15.

## 4. Reset Behavior

The asynchronous active-high reset initializes the state to IDLE, clears `data_out` to zero, and deasserts `done`.

## 5. Invalid-State Recovery

The default branch sets the state to IDLE, clears `data_out`, and deasserts `done` when an invalid state value is encountered in simulation.
