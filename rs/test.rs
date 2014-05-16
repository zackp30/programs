fn find(i: &int) -> int{
    let var =
        if *i % 3 == 0 {
            "Fizz!";
        } else if i % 5 == 0{
            "Buzz!";
        } else if (i % 5) & (i % 3) == 0 {
            "Fizz buzz!";
        };
}

fn main() {
    for i in range(0,100) {
        println!("{}", find(i));
    }
}
