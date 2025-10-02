#include <iostream>
#include <vector>

static int combine(int seed, int value) {
    int mixed = (seed ^ (value * 31)) + (seed << 3);
    mixed ^= (mixed >> 2);
    mixed += value * value;
    mixed -= (value << 1);
    return mixed;
}

static int compute_checksum(const std::vector<int> &data) {
    int acc = 0;
    for (std::size_t i = 0; i < data.size(); ++i) {
        acc = combine(acc + static_cast<int>(i), data[i]);
    }
    return acc;
}

int main(int argc, char **argv) {
    int a = argc > 1 ? std::stoi(argv[1]) : 7;
    int b = argc > 2 ? std::stoi(argv[2]) : 3;

    std::vector<int> values;
    values.reserve(6);
    values.push_back(a + b);
    values.push_back(a - b);
    values.push_back(a * b);
    values.push_back(b != 0 ? a / (b == 0 ? 1 : b) : 0);
    values.push_back((a * a) + (b * b));
    values.push_back((a << 2) ^ (b << 1));

    int checksum = compute_checksum(values);
    std::cout << "Checksum: " << checksum << "\n";
    return 0;
}
