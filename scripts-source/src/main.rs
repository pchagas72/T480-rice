use chrono::{Local, Timelike};
use sysinfo::{CpuRefreshKind, Disks, MemoryRefreshKind, RefreshKind, System};
use std::env;
use std::fs;

fn get_pywal_color(index: usize, fallback: &str) -> String {
    let home = env::var("HOME").unwrap_or_else(|_| String::from("/home/pedro"));
    let path = format!("{}/.cache/wal/colors", home);
    if let Ok(content) = fs::read_to_string(path) {
        if let Some(line) = content.lines().nth(index) {
            return line.to_string();
        }
    }
    fallback.to_string()
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

fn bytes_to_gigabytes(raw: u64) -> f64 {
    raw as f64 / 1_073_741_824.0
}

fn main() {
    // Dynamic Pywal Colors with hardcoded fallbacks
    let key_color = get_pywal_color(4, "#54a4b0");
    let integer_color = get_pywal_color(2, "#98c379");
    let string_color = get_pywal_color(3, "#d19a66");

    // Time Data
    let dt = Local::now();
    let hour = dt.format("%H").to_string();
    let minute = dt.format("%M").to_string();
    let day = dt.format("%d").to_string();
    let month = dt.format("%m").to_string();
    let year = dt.format("%y").to_string();
    let day_percentage = get_day_percentage(dt.hour(), dt.minute(), dt.second());
    let day_abbreviation = dt.format("%a").to_string();
    let day_of_week_str = translate_day_of_week(&day_abbreviation);

    // System Data
    let mut sys = System::new_with_specifics(
        RefreshKind::everything()
            .with_cpu(CpuRefreshKind::everything())
            .with_memory(MemoryRefreshKind::everything()),
    );
    let disks = Disks::new_with_refreshed_list();

    std::thread::sleep(sysinfo::MINIMUM_CPU_UPDATE_INTERVAL);
    sys.refresh_all();
    
    let cpu_percentage: f32 = sys.global_cpu_usage();
    let used_memory: f64 = bytes_to_gigabytes(sys.used_memory());
    let total_memory: f64 = bytes_to_gigabytes(sys.total_memory());
    let mut total_disk: u64 = 0;
    let mut used_disk: u64 = 0;

    for disk in disks.list(){
        total_disk += disk.total_space();
        used_disk += disk.total_space() - disk.available_space();
    }

    // Combined formatting using named arguments to keep the macro clean
    let pango_output = format!(
        "<span color='{key}'>const</span> system_info = {{\n  \
         <span color='{key}'>day_of_week</span>: <span color='{str_c}'>\"{}\"</span>\n  \
         <span color='{key}'>hour</span>: <span color='{int_c}'>{}</span>\n  \
         <span color='{key}'>minute</span>: <span color='{int_c}'>{}</span>\n  \
         <span color='{key}'>day</span>: <span color='{int_c}'>{}</span>\n  \
         <span color='{key}'>month</span>: <span color='{int_c}'>{}</span>\n  \
         <span color='{key}'>year</span>: <span color='{int_c}'>{}</span>\n  \
         <span color='{key}'>day_percentage</span>: <span color='{int_c}'>{:.2}%</span>\n  \
         <span color='{key}'>ram</span>: <span color='{int_c}'>{:.2}/{:.2}G</span>\n  \
         <span color='{key}'>cpu</span>: <span color='{int_c}'>{:.2}%</span>\n  \
         <span color='{key}'>disk</span>: <span color='{int_c}'>{:.2}/{:.2}G</span>\n\
         }}",
        day_of_week_str, hour, minute, day, month, year, day_percentage,
        used_memory, total_memory, cpu_percentage, bytes_to_gigabytes(used_disk), bytes_to_gigabytes(total_disk),
        key = key_color, str_c = string_color, int_c = integer_color
    );

    println!("{}", pango_output);
}
