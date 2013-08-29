#!/usr/bin/env ocaml

while true do try
  Printf.printf "Please enter the ODE version number you're using\n\
                 Example: 0.10.0\n%!";
  let major, minor, micro =
    Scanf.sscanf (input_line stdin) "%d.%d.%d" (fun a b c -> (a,b,c))
  in
  let out_file = (try Sys.argv.(1) with _ -> "ode_version.h") in

  Printf.printf "Understood ODE version:\n";
  Printf.printf "  major version number: %d\n" major;
  Printf.printf "  minor version number: %d\n" minor;
  Printf.printf "  micro version number: %d\n" micro;
  Printf.printf "writting according header: %s\n" out_file;
  Printf.printf "%!";

  let oc = open_out out_file in
  Printf.fprintf oc "/* generated by ask_version.ml */\n";
  Printf.fprintf oc "#define ODE_VERSION_MAJOR %d\n" major;
  Printf.fprintf oc "#define ODE_VERSION_MINOR %d\n" minor;
  Printf.fprintf oc "#define ODE_VERSION_MICRO %d\n" micro;
  close_out oc;
  exit 0
with Scanf.Scan_failure _ -> () done
;;
