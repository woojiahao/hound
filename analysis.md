- When starting a server, we set the defaults of the drivers through the `Hound.ConnectionServer.start_link` function
- Use the assignment operator in a parameter to match the parameter to a given type while assigning the type to a name
  
  ```elixir
  defmodule User do
    defstruct [:name, :birthday, :hobbies]
  end

  def foo(%User{} = user) do
    IO.puts user[:name]
  end
  ```

- Using pattern matching to assign values based on input type (which is an atom), e.g. `internal_helpers.ex`
- Sessions are managed by relating the process's ID to the sessions available and these are stored in ETS under the module
- Instead of requiring the current session to be passed around, the session is saved and accessed per API call and this helps to reduce the complexity of trying to pass the sessions
- How are new browser sessions opened? 

  Something to do with the `navigate_to` method. No, done using `hound_session()`

- Lifecycle of the application: 
  - `hound_session()` starts a new session in the context of an ExUnit test setup
  - With the setup completed, the test cases can access the sessions accordingly and navigate/interact with pages accordingly
    TODO: Learn how `setup` works in ExUnit
  - When the test case/suite is completed, tear down the session

- Using `defdelegate`