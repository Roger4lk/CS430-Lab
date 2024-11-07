
fn ordinal(num: u32) -> String {
    let second_to_last : Option<char> = num.to_string().chars().nth(num.to_string().len()-1).unwrap();
    let last = num.to_string().chars().last().unwrap();
    let lastdig = format!("{}{}", if second_to_last.is_none() {""} else {second_to_last}, last);
    let end = match lastdig.as_str() {
        " 1" => "st",
        " 2" => "nd",
        " 3" => "rd",
        "01" => "st",
        "02" => "nd",
        "03" => "rd",
        _ => "th",
    };

    format!("{}{}",num, end)
}

fn main() {
    for item in 0..130 {
        print!("{}\n", ordinal(item));
    }
}
