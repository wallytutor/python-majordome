//////////////////////////////////////////////////////////////////////////////
/// Text manipulation utilities
//////////////////////////////////////////////////////////////////////////////

pub fn dedent(s: &str) -> String {
    let lines: Vec<&str> = s.lines().collect();

    if lines.is_empty() {
        return String::new();
    }

    // Find minimum indentation (ignoring empty lines)
    let min_indent = lines.iter()
        .filter(|line| !line.trim().is_empty())
        .map(|line| line.chars().take_while(|c| c.is_whitespace()).count())
        .min()
        .unwrap_or(0);

    // Remove that indentation from all lines
    lines.iter()
        .map(|line| {
            if line.len() >= min_indent {
                &line[min_indent..]
            } else {
                line
            }
        })
        .collect::<Vec<_>>()
        .join("\n")
}
