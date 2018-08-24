// #[derive(Debug)]
struct Structure {
    index: u32,
    value: String,
}


fn main() {
    // let some_value = 10;
    // 10 = some_value; // it's invalid since "=" is not "pattern match" in Rust

    let magic_value = 11;

    // handling pattern match (elegant way):
    match magic_value {
        10 => println!("Impossible!"),
        11 => println!("Match!"),
        e if e > 20 => println!("Too big too furious!"),
        _ => println!("No match!"),
    }

    match 21 {
        10 => println!("Impossible!"),
        11 => println!("Match!"),
        e if e > 20 => println!("Too big too furious!"),
        _ => println!("No match!"),
    }

    let tuple2 = (10, "abc"); // tuple is a pair here, but also can be tripple, quadruple, …
    // only single case, any other case will be no-op!
    if let (_, "abc") = tuple2 {
        println!("Any first value, but second pair element is 'abc'!");
    }

    // all possible cases, no possibility of getting something unexpected
    match tuple2 {
        (1, "") => println!("No match"),
        (10, value) => println!("It's 10 and I got value, which is: {}", value),
        (_, _) => println!("Any pair match"),
        // _ => println!( "Anything!"), - commented out since Rust will throw a warning here since it knows it's unreachable pattern that will never ever match (previous match satisfy any possibility)
    }

    // NOTE: this is not allowed, since it's strong typed language. You cannot match ambiguous value to the certain type:

    // match "abstract_value_that_makes_no_sense" {
    //     (1, "") => println!( "No match"),
    //     (10, value) => println!( "It's 10 and I got value, which is: {}", value),
    //     (_, _) => println!( "Any pair match"),
    //     named_value => println!( "Got ambiguous value: {:?}!", named_value),
    // }

    // example with structure - under the hood it's just named Map hence it's similar to %{}
    let structure = Structure {
        index: 123,
        value: "Stefan".to_string(),
    };
    match structure {
        Structure {
            index: an_index,
            value: a_value,
        } => {
            println!(
                "Got structure with index: {} and value: {}",
                an_index,
                a_value
            )
        }
        // _ => println!( "No match"), - same here, compiler will warn since it knows any structure will always match only Structure{}
    }

}
