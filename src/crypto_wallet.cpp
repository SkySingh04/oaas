/**
 * Cryptocurrency Wallet Example
 * Demonstrates private key management, transaction signing, and seed phrases
 * Extremely sensitive code that MUST be obfuscated in production
 */

#include <iostream>
#include <string>
#include <cstring>
#include <cstdlib>

// Wallet configuration (HIGHLY SENSITIVE)
const char* PRIVATE_KEY = "5KYZdUEo39z3FPrtuX2QbbwGnNP5zTd7yyr2SC1j299sBCnWjss";
const char* SEED_PHRASE = "witch collapse practice feed shame open despair creek road again ice least";
const char* WALLET_ADDRESS = "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa";
const char* ENCRYPTION_PASSPHRASE = "MyUltraSecurePassphrase2024!";

// Transaction fee rates (in satoshis per byte)
const int LOW_FEE = 1;
const int MEDIUM_FEE = 5;
const int HIGH_FEE = 10;

// Wallet state
static double wallet_balance = 100.5;  // in BTC
static int transaction_count = 0;
static bool is_wallet_locked = true;

// Validate private key format
bool is_valid_private_key(const char* key) {
    if (!key) return false;
    size_t len = strlen(key);
    // WIF private key should be 51 characters
    return len == 51 || len == 52;
}

// Unlock wallet with passphrase
bool unlock_wallet(const char* passphrase) {
    if (!passphrase) {
        return false;
    }

    if (strcmp(passphrase, ENCRYPTION_PASSPHRASE) == 0) {
        is_wallet_locked = false;
        std::cout << "✓ Wallet unlocked successfully\n";
        return true;
    }

    std::cout << "❌ Invalid passphrase\n";
    return false;
}

// Lock wallet
void lock_wallet() {
    is_wallet_locked = true;
    std::cout << "🔒 Wallet locked\n";
}

// Get wallet balance
double get_balance() {
    return wallet_balance;
}

// Get wallet address
const char* get_wallet_address() {
    return WALLET_ADDRESS;
}

// Get private key (EXTREMELY SENSITIVE)
const char* get_private_key() {
    if (is_wallet_locked) {
        std::cout << "❌ Wallet is locked! Cannot access private key.\n";
        return nullptr;
    }
    return PRIVATE_KEY;
}

// Get seed phrase (EXTREMELY SENSITIVE)
const char* get_seed_phrase() {
    if (is_wallet_locked) {
        std::cout << "❌ Wallet is locked! Cannot access seed phrase.\n";
        return nullptr;
    }
    return SEED_PHRASE;
}

// Calculate transaction fee
double calculate_transaction_fee(int tx_size_bytes, int fee_rate) {
    // Fee in satoshis
    long long fee_satoshis = tx_size_bytes * fee_rate;
    // Convert to BTC
    return fee_satoshis / 100000000.0;
}

// Sign transaction (simplified)
bool sign_transaction(double amount, const char* recipient_address, int fee_rate) {
    if (is_wallet_locked) {
        std::cout << "❌ Wallet is locked! Cannot sign transaction.\n";
        return false;
    }

    if (amount <= 0) {
        std::cout << "❌ Invalid amount\n";
        return false;
    }

    if (!recipient_address) {
        std::cout << "❌ Invalid recipient address\n";
        return false;
    }

    // Calculate fee (assume 250 byte transaction)
    double fee = calculate_transaction_fee(250, fee_rate);
    double total = amount + fee;

    if (total > wallet_balance) {
        std::cout << "❌ Insufficient balance\n";
        return false;
    }

    // Simulate signing with private key
    const char* key = get_private_key();
    if (!key) {
        return false;
    }

    // Update balance and counter
    wallet_balance -= total;
    transaction_count++;

    std::cout << "✓ Transaction signed successfully!\n";
    std::cout << "  Amount: " << amount << " BTC\n";
    std::cout << "  Fee: " << fee << " BTC\n";
    std::cout << "  Total: " << total << " BTC\n";
    std::cout << "  New Balance: " << wallet_balance << " BTC\n";

    return true;
}

// Export wallet backup (seed + private key)
bool export_wallet_backup() {
    if (is_wallet_locked) {
        std::cout << "❌ Wallet is locked! Cannot export backup.\n";
        return false;
    }

    std::cout << "\n⚠ WARNING: Keep this information secure!\n";
    std::cout << "===========================================\n";
    std::cout << "Address: " << WALLET_ADDRESS << "\n";
    std::cout << "Private Key: " << PRIVATE_KEY << "\n";
    std::cout << "Seed Phrase: " << SEED_PHRASE << "\n";
    std::cout << "===========================================\n";

    return true;
}

// Restore wallet from seed
bool restore_from_seed(const char* seed) {
    if (!seed) {
        return false;
    }

    if (strcmp(seed, SEED_PHRASE) == 0) {
        std::cout << "✓ Wallet restored successfully!\n";
        return true;
    }

    std::cout << "❌ Invalid seed phrase\n";
    return false;
}

int main(int argc, char** argv) {
    std::cout << "=== Cryptocurrency Wallet Manager ===\n\n";

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <command> [args]\n\n";
        std::cout << "Commands:\n";
        std::cout << "  balance                    - Show wallet balance\n";
        std::cout << "  unlock <passphrase>        - Unlock wallet\n";
        std::cout << "  send <amount> <address>    - Send transaction (wallet must be unlocked)\n";
        std::cout << "  export                     - Export wallet backup\n";
        std::cout << "  lock                       - Lock wallet\n";
        return 1;
    }

    const char* command = argv[1];

    if (strcmp(command, "balance") == 0) {
        std::cout << "Wallet Address: " << get_wallet_address() << "\n";
        std::cout << "Balance: " << get_balance() << " BTC\n";
        std::cout << "Transactions: " << transaction_count << "\n";
    }
    else if (strcmp(command, "unlock") == 0) {
        if (argc < 3) {
            std::cout << "Usage: " << argv[0] << " unlock <passphrase>\n";
            return 1;
        }
        unlock_wallet(argv[2]);
    }
    else if (strcmp(command, "send") == 0) {
        if (argc < 4) {
            std::cout << "Usage: " << argv[0] << " send <amount> <address>\n";
            return 1;
        }
        double amount = atof(argv[2]);
        const char* address = argv[3];
        sign_transaction(amount, address, MEDIUM_FEE);
    }
    else if (strcmp(command, "export") == 0) {
        export_wallet_backup();
    }
    else if (strcmp(command, "lock") == 0) {
        lock_wallet();
    }
    else {
        std::cout << "Unknown command: " << command << "\n";
        return 1;
    }

    return 0;
}
