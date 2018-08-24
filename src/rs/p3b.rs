// Rust is modern FP language hence it already has all basic monadic types built in:

// Result monad in action:


fn first_part(process_value: u64) -> Result<u64, String> {
    Ok(process_value + 1)
}


fn second_part(process_value: u64) -> Result<u64, String> {
    match process_value {
        3 => Ok(process_value + 13),
        value if value % 2 == 0 => Ok(value + 5),
        _ => Err("Oh so fatal ERROR!".to_string()),
    }
}



fn main() {
    {
        let result = first_part(1)
                        .and_then(second_part)
                        .and_then(first_part)
                        .and_then(first_part)
                        .unwrap_or(666);
        println!("Value result 1: {}", result);
    }
    {
        let result = first_part(2)
                        .and_then(second_part)
                        .unwrap_or(666);
        println!("Value result 2: {}", result);
    }
    {
        let result = first_part(3)
                        .and_then(second_part)
                        .unwrap_or(666);
        println!("Value result 3: {}", result);
    }
    {
        let result = first_part(11)
                        .and_then(second_part)
                        .unwrap_or(666);
        println!("Value result 4: {}", result);
    }
    {
        let result = first_part(10)
                        .and_then(second_part) // this one will return Err(), so
                        .and_then(first_part) // this is NO-OP here!!
                        .and_then(second_part) // this is NO-OP here too!!
                        .and_then(first_part) // you can have any amount of steps in a flow, but flow ends when Err happens so
                        .map_err(|error| println!("Something went wrong here! Cause: {}!", error)) // we map our errors and print it out. We could do panic!() here to immediately terminate the application, but println macro is used for example purposes
                        .unwrap_or(666); // since error was returned.. we return some erronous value
        println!("Value result 5: {}", result);

        // NOTE: now count how many if / else statements would you write here in imperative programming language :)
    }
}

