mod operations {

    /* Sums all numbers in given range */
    pub fn sumall(of: u32) -> u32 {
        if of > 0 {
            of + sumall(of - 1)
        } else {
            0
        }
    }


    /* Counts factorial of given number */
    pub fn factorial(of: u32) -> u32 {
        if of > 1 {
            of * factorial(of - 1)
        } else {
            1
        }
    }

}


fn main() {
    use operations::*;

    // let of = 0;
    let of = 10;

    /* 1st call */ println!("Rust: {}! = {}, sumall = {}", of, factorial(of), sumall(of));
    /* Nth call */ println!("Rust: 0! = {}, sumall = {}", factorial(0), sumall(0));
}
