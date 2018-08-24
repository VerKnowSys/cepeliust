fn main() {

    // anonymous functions:
    let fun3 = |argument| argument + 1;
    let anon_fun_in_fun = || fun3(1) + 1;
    let _other_example_lambda = |arg: i32, arg2: String| { println!("Tadam: {}, {}", arg, arg2); };

    println!("fun3: {}", fun3(665)); // eager invocation
    let closure = anon_fun_in_fun; // cause you can bind closure (anonymous function) to normal value- it's lazy closure
    println!("anon_fun_in_fun: {:?}", closure()); // lazy closure invocated, and evaluated to value: 3

    // lazy evaluation:
    let result = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        .iter()
        .skip(2)
        .take(5)
        .filter(|element| *element % 2 == 1)
        .map(|element| *element * 2);

    println!("Lazy result: {:?}", result); // lazy

    let other_required_state = true; // simulate situation when something doesn't have to be processed at all if other conditions aren't satisfied - this way you can simply discard whole lazy processing.. and gain significant performance boost of your software
    if other_required_state {
        let eager_result: Vec<u32> = result.collect(); // eagerly collecting Vector or unsigned integers
        println!("{:?}", eager_result) // print expected values: [6, 10, 14]
    }

}
