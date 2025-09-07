use chrono::{Local, Timelike};

fn main() {
    let dt = Local::now();

    let hour = dt.hour();
    let minute = dt.minute();
    let second = dt.second();
    let day_percentage = get_day_percentage(hour, minute, second);

    let day_abbreviation = dt.format("%a").to_string();
    let day_of_week_str = translate_day_of_week(&day_abbreviation);

    let key_color = "#54a4b0";
    let integer_color = "#98c379";
    let string_color = "#d19a66";

    let pango_output = format!(
        "<span color='{}'>{}</span> current_time = {{\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>\"{}\"</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{}</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{:.2}%</span>\n\
         }}",
        key_color, "const",
        key_color, "year", integer_color, dt.format("%y"),
        key_color, "month", integer_color, dt.format("%m"),
        key_color, "day", integer_color, dt.format("%d"),
        key_color, "day_of_week", string_color, day_of_week_str,
        key_color, "hour", integer_color, dt.format("%H"),
        key_color, "minute", integer_color, dt.format("%M"),
        key_color, "second", integer_color, dt.format("%S"),
        key_color, "day_percentage", integer_color, day_percentage
    );

    println!("{}", pango_output);
}

fn get_day_percentage(hour: u32, min: u32, sec: u32) -> f64 {
    const SECONDS_IN_A_DAY: f64 = 86400.0;
    let total_seconds_passed = (hour as f64 * 3600.0) + (min as f64 * 60.0) + (sec as f64);
    (total_seconds_passed / SECONDS_IN_A_DAY) * 100.0
}

fn translate_day_of_week(day: &str) -> &str {
    match day {
        "Sun" => "Domingo",
        "Mon" => "Segunda",
        "Tue" => "Terça",
        "Wed" => "Quarta",
        "Thu" => "Quinta",
        "Fri" => "Sexta",
        "Sat" => "Sábado",
        _ => "???"
    }
}
