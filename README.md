# State Management

##  create different blocs
Dealing with different Types of Blocs.


- Requirement1: 
  - Title: Create two different BLoCs
  - Description:
    - A CounterBloc to handle integer value
    - A ThemeBloc to toggle between light and dark themes.
- Requirement2: 
  - Title: Bloc Listener & Bloc Builder & Bloc Consumer.
  - Description:
    - Use BlocListener in a small app to show a SnackBar when the counter reaches a specific value.
    - Display the counter value using BlocBuilder and update the UI whenever the counter changes.
    - Combine BlocListener and BlocBuilder in a single widget using BlocConsumer to display the counter and show a SnackBar for specific counter values
    
   
==================================================
#### Draft

  - create different `cubits` for theme and counter. 
  - create `cubit_state` to notify any changes.
  - create `cubit_logic` to handle all changes and logics.
  - use `BlocProvider` to notify the app of using cubit.
  - use `BlocBuilder` to change view based on any changes on state.
  - use `BlocListener` to show snackbar based on state.
