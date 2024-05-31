{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  nativeBuildInputs = [
	nmap
	masscan
	burpsuite
	metasploit
	sqlmap
	dirb
	thc-hydra
	ffuf
	inetutils
	gobuster
	dirb
	responder
	john
  ];
}
