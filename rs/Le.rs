fn main() {
  let stuff = ["Stuff", "Stuff", "Stuff"];

  for i in stuff {
    spawn(proc() {
      println!("{:s}", i);
    });
  };
}
