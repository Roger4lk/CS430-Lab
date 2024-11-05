use std::thread;
use std::time::Duration;
use std::io;
use std::io::Write;


fn main() {
    let mut time = 10;
    let mut stdout = io::stdout();
    while time >= 0 {
        print!("\r{} seconds left", time);  // \r returns the print curser to the left margin
        thread::sleep(Duration::from_millis(500));
        stdout.flush().unwrap(); // if thers an error unwrap makes the program fail
        time -= 1;
    }
    println!("\rcongrats          ");
}