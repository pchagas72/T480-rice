use sysinfo::{CpuRefreshKind, Disks, MemoryRefreshKind, RefreshKind, System};

fn main() {

    // Colors
    let key_color = "#54a4b0";
    let integer_color = "#98c379";

    // System related data
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

    let pango_output = format!(
        "<span color='{}'>{}</span> system = {{\n  \
         <span color='{}'>{}</span>: <span color='{}'>{:.2}/{:.2}G</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{:.2}%</span>\n  \
         <span color='{}'>{}</span>: <span color='{}'>{:.2}/{:.2}G</span>\n\
         }}",
        key_color, "let mut",
        key_color, "ram", integer_color,used_memory,total_memory,
        key_color, "cpu", integer_color,cpu_percentage,
        key_color, "disk", integer_color,
                bytes_to_gigabytes(used_disk),bytes_to_gigabytes(total_disk),
    );

    println!("{}", pango_output);
}

fn bytes_to_gigabytes(raw: u64) -> f64{
    raw as f64 / 1_073_741_824.0
}
