# Crea una instancia de Compute Engine
resource "google_compute_instance" "vm_instance" {
  name         = "instancia-curso-terraform"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}