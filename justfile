default: gen lint

force: clean gen

gen:
    flutter pub get
    flutter_rust_bridge_codegen \
        --rust-input \
        "native/src/rule_api.rs" \
        "native/src/ucci_api.rs" \
        "native/src/util_api.rs" \
        --dart-output \
        "lib/gened_rule_api.dart" \
        "lib/gened_ucci_api.dart" \
        "lib/gened_util_api.dart" \
        --rust-output \
        "native/src/gened_rule_api.rs" \
        "native/src/gened_ucci_api.rs" \
        "native/src/gened_util_api.rs" \
        --class-name \
        "RuleApi" \
        "UcciApi" \
        "UtilApi" \
        --dart-decl-output lib/bridge_definitions.dart \
        --wasm \

    #
    # --inline-rust \


lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean && cargo update

serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}

# vim:expandtab:sw=4:ts=4