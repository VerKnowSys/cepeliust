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


    /* sum list of values v1 */
    pub fn sum_list1(vector: &Vec<usize>) -> usize {
        vector
            .iter()
            .fold(0, |value, accum| value + *accum)
    }


    /* sum list of values v2 */
    pub fn sum_list2(vector: &Vec<usize>) -> usize {
        vector
            .iter()
            .sum()
    }

}


fn main() {
    use operations::*;

    // let of = 0;
    let of = 10;

    /* 1st call */
    println!("Rust: {}! = {}, sumall = {}",
             of, factorial(of), sumall(of));
    /* Nth call */
    println!("Rust: 0! = {}, sumall = {}",
             factorial(0), sumall(0));

    let a_list = vec!(1,2,3,4,5,6,7,8,9,10);
    println!("a_list1: {:?}", &a_list);
    println!("Sum_list1: {}, Sum_list2: {}",
             sum_list1(&a_list), sum_list2(&a_list));
}
