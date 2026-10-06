pub fn greet() -> &'static str {
    "node+rust"
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn greets() {
        assert_eq!(greet(), "node+rust");
    }
}
