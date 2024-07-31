[BITS 16]                ; Mengatur mode 16-bit
[ORG 0x7C00]             ; Menetapkan alamat awal boot sector

start:
    ; Mengatur stack
    xor ax, ax           ; Mengatur AX ke 0
    mov ss, ax           ; Mengatur segmen stack ke 0
    mov sp, 0x7C00       ; Mengatur pointer stack ke 0x7C00

    ; Mengatur segmen data
    mov ds, ax           ; Mengatur segmen data ke 0
    mov es, ax           ; Mengatur segmen ekstra ke 0

    ; Menampilkan pesan
    mov si, hello_msg    ; Mengatur SI ke alamat pesan
    call print_string    ; Memanggil fungsi untuk mencetak string

    ; Loop tak terbatas
hang:
    jmp hang             ; Melompat ke dirinya sendiri untuk menghentikan eksekusi

print_string:
    mov ah, 0x0E         ; Mengatur fungsi BIOS untuk mencetak karakter
.next_char:
    lodsb                ; Memuat byte dari [DS:SI] ke AL
    cmp al, 0            ; Membandingkan dengan null (akhir string)
    je .done             ; Jika null, selesai
    int 0x10             ; Panggil interrupt BIOS untuk mencetak karakter
    jmp .next_char       ; Ulangi untuk karakter berikutnya
.done:
    ret                  ; Kembali dari fungsi

hello_msg db 'Hello, world!', 0 ; Mendefinisikan string dengan null terminator

times 510-($-$$) db 0   ; Mengisi sisa sektor dengan nol
dw 0xAA55               ; Signature boot sector
