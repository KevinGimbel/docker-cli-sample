use std::env;
use std::fs;

fn main() -> std::io::Result<()> {
    let args: Vec<String> = env::args().collect();
    println!("{:?}", args);
    fs::write("docker-cli-sample.log", format!("Args: {:?}", args))?;
    Ok(())
}