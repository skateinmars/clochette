Action::NoOp = OpenStruct.new(perform: true)
Action.register_action 'no_op', Action::NoOp
