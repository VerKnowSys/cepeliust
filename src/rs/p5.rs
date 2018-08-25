/// Extend structs with shared fields
macro_rules! struct_ext {

    ($name:ident { $( $field:ident: $ty:ty ),* $(,)* }) => {


        #[derive(Debug, Clone)]
        pub struct $name {

            /// inject name!
            pub name: String,

            $(
              /// public Meta field
              pub $field: $ty
            ),*
        }


        impl $name {

            /// Create new instance of given type
            pub fn new() -> Self {
                Self::default()
            }

        }


        impl Default for $name {
            fn default() -> Self {
                Self {
                    name: "NoName".to_string(),
                    other_value: Some("shiny default value".to_string()),
                    my_shiny_field: None,
                }
            }
        }
    }
}


struct_ext!(MyStruct {

    other_value: Option<String>,

    my_shiny_field: Option<u64>,

});


fn main() {
    let my = MyStruct{
        name: "My1".to_string(),

        .. MyStruct::default()
    };

    println!("Default: {:?}", MyStruct::new());
    println!("my: {:?}", my);
}
