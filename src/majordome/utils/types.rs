use std::fmt::Debug;

pub fn variant_name_upper<T: Debug>(variant: &T) -> String {
    let dbg = format!("{:?}", variant);

    let mut s = String::new();

    for (i, c) in dbg.chars().enumerate() {
        if c.is_uppercase() && i > 0 {
            s.push('_');
        }
        s.push(c.to_ascii_uppercase());
    }
    s
}