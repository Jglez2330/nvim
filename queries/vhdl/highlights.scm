; 3.2 Entity declaration {{{
(type_mark) @type
(comment) @comment
[
    "entity"
    "architecture"
    "is"
    "of"
    "begin"
    "end"
    "type"
    "to"
    "downto"
    "signal"
    "record"
    "array"
    "others"
    "process"
    "component"
    "constant"
    (mode)
    "port"
    "generic"
    "if"
    "elsif"
    "else"
    "case"
    "then"
    "when"
    "generate"
    "loop"
    "for"
    "in"
    "function"
    "return"
    "range"

    ; ((port_clause "port"))
    ; ((generic_clause "generic"))

    ; ((port_map_aspect "port"))
    ; ((generic_map_aspect "generic"))
    "map"
] @keyword

(function_body
    designator: (identifier) @function)
(function_body
    at_end: (simple_name) @function)

[
    "library"
    "use"
] @include
[
"("
")"
"["
"]"
] @punctuation.bracket

[
    "."
    ";"
    ","
    ":"
] @delimeter

[
    "=>"
    "<="
    "+"
    ":="
    "="
    "/="
    "<"
    ">"
    "-"
    "*"
    "/"
    "xor"
    "and"
    "nand"
    "or"
    "nor"
    (attribute_name "'")
    (index_subtype_definition (any))
] @operator

[
    ((character_literal))
    (integer_decimal)
] @number

(string_literal) @string
(bit_string_literal) @string

(generic_map_aspect
    (association_list
        (named_association_element
            formal_part: (simple_name) @parameter)))
(port_map_aspect
    (association_list
        (named_association_element
            formal_part: (simple_name) @field))) ; TODO maybe should be @parameter

(sensitivity_list (_) @variable)

(default_expression (simple_name) @variable)

; TODO: this capture also captures indexing signals as if they're functions.
; Don't know if there's anyway around that, might just need to either have
; function calls highlighted as variables or vice versa
(expression
    (ambiguous_name
        prefix: ((simple_name) @variable)
        (expression_list)))

(conditional_expression
    (simple_name) @variable
)
(conditional_expression
    (parenthesized_expression
        (simple_name) @variable))

(relation
    (simple_name) @variable)
(attribute_name
    prefix: (_) @variable
    designator: (_) @field)


; ascending and descending specs. TODO see if these can be merged into one
; query these two are for when there is an expression with multiple arguments,
; such as (a - b - 1 downto 0)
(_
    low: (simple_expression (simple_expression (simple_name) @constant)))
(_
    high: (simple_expression (simple_expression (simple_name) @constant))
)
; ascending and descending specs. TODO see if these can be merged into one
; query these two are for when there is an expression with a single argument
; such as (a downto 0)
(_
    low: ((simple_expression (simple_name) @constant)))
(_
    high: ((simple_expression (simple_name) @constant))
)

(expression
    (simple_expression (simple_name) @variable))

(entity_declaration
    name: (identifier) @variable
    at_end: (simple_name) @variable)

(component_declaration
    name: (identifier) @method
    at_end: (simple_name) @variable)

(full_type_declaration
    name: (identifier) @type)

(record_type_definition
    at_end: (simple_name) @type)

(architecture_body
    name: (identifier) @method
    entity: (simple_name) @variable
    at_end: (simple_name) @method)

(component_instantiation
    component: (simple_name) @variable)

(label (identifier) @label)

(process_statement
    at_end: (simple_name) @label)

(for_generate_statement
    at_end: (simple_name) @label)

(if_generate_statement
    at_end: (simple_name) @label)

(entity_instantiation
    entity: (selected_name
        prefix: (simple_name) @namespace
        suffix: (simple_name) @variable))

(library_clause
    (logical_name_list
        library: (simple_name) @namespace))
(use_clause
    (selected_name
        prefix: (selected_name
            prefix: (simple_name) @namespace)
        suffix: (_) @function
))
(use_clause
    (selected_name
        prefix: (simple_name) @namespace
))

(constant_declaration
    (identifier_list
        (identifier) @constant))

(signal_interface_declaration
    (identifier_list
        (identifier) @variable))

(signal_declaration
    (identifier_list
        (identifier) @variable))

(record_type_definition
    (_
    (identifier_list
        (identifier) @field)))

(simple_waveform_assignment
    target: (_) @variable)

(constant_interface_declaration
    (identifier_list
        (identifier) @constant))

(simple_concurrent_signal_assignment
    target: (simple_name) @variable)

(ambiguous_name
        prefix: (simple_name) @variable)

(expression (simple_name) @variable)

(parameter_specification
    name: (identifier) @variable)


