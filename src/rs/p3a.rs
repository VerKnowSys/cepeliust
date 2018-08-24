// Rust is modern FP language hence it already has all basic monadic types built in:

// Option monad in action:

fn moja_fun() -> String {
    String::from("i am String from moja_fun()")
}


fn main() {
    // Option monad is generic, so can be used with any type, here I will use only String type:

    let a_string = Some("My first utf8 String with λ".to_string());
    let simply_what_i_have_here = match a_string.clone() {
        Some(some_string) => some_string,
        None => "".to_string(),
    };
    println!("I got: {}", simply_what_i_have_here);

    let b_string = Some("Second string with λ".to_string());

    // this is "flow chaining":

    // NOTE: we don't have any if's any validation, it will process each case!
    let if_not_a_then_b = b_string.clone().unwrap_or_else(
        // anonymous function, but can be a function returning valid type too!
        || a_string.clone().unwrap(),
    );
    println!("if_not_a_then_b: {}", if_not_a_then_b);

    // same thing, just calling specified function - NOTE: we don't call this function directly via moja_fun() but specifying it as function to be lazy evaled on demand!
    let if_not_a_then_b_via_fun = b_string.unwrap_or_else(moja_fun);
    println!("if_not_a_then_b_via_fun: {}", if_not_a_then_b_via_fun);

    //.unwrap_or(Some("Nic nie ma, nic nie będzie".to_string()));
    let none_of_string = match a_string {
        _ => None,
    };
    let no_string = none_of_string.unwrap_or(Some("I'm default value if no value specified!".to_string()));
    println!("no_string (no unwrap): {:?}", no_string);
    println!("no_string (unwrapped value): {:?}", no_string.unwrap());

}
