#!/usr/bin/perl

# Bios Security
# https://biossec.wordpress.com/

# Bibliotecas

use Getopt::Long;
use warnings;
use strict;
require LWP;
use LWP::UserAgent;
use LWP::Simple;

# Variaveis

my ($site, $asp, $aspx, $cfm, $html, $php, $ajuda, $op, $unix, $os);

# Opçoes

$op = GetOptions(
    'site=s'  => \$site,
	'asp'   => \$asp,
	'aspx'  => \$aspx,
	'cfm'   => \$cfm,
	'html'  => \$html,
	'php'   => \$php,
	'ajuda'   => \$ajuda,
);

# Determinar quem  é linux e quem é windows

$os = $^O; 
$unix = ""; 

if (index(lc($os),"win")!=-1){ 
	$unix="0"; # windows 
	}
	else { 
		$unix="1"; # unix
} 

# Limpar Tela 

if($unix){ 
	system("clear"); 
	} 
	else {
	system("cls");
}

# Logo

print "
Visite: Http://www.BiosSec.WordPress.Com

     >=>             >=======>                   >=>                   
  >=>   >=>          >=>        >>               >=>                   
 >=>        >=> >=>  >=>           >==>>==>      >=>   >==>    >> >==> 
 >=>        >>   >=> >=====>   >=>  >=>  >=>  >=>>=> >>   >=>   >=>    
 >=>        >>   >=> >=>       >=>  >=>  >=> >>  >=> >>===>>=>  >=>    
  >=>   >=> >=> >=>  >=>       >=>  >=>  >=> >>  >=> >>         >=>    
    >===>   >=>      >=>       >=> >==>  >=>  >=>>=>  >====>    >==>   	
            >=>                                                        
			
            By: Bios Security                Skype: Root.Xml
", "\n";

# -ajuda / Ajuda

if($ajuda){
	print "[!] Ajuda", "\n\n";
	print "   Opcao     Funcao                         Modo de uso", "\n\n";
	print "   -site   Especifica o site   Perl Cpfinder.pl -site www.exemplo.com", "\n";
	print "   -asp    Linguagem Asp       Perl Cpfinder.pl -site www.exemplo.com -asp", "\n";
	print "   -aspx   Linguagem Aspx      Perl Cpfinder.pl -site www.exemplo.com -aspx", "\n";
	print "   -cfm    Linguagem cfm       Perl Cpfinder.pl -site www.exemplo.com -cfm", "\n";
	print "   -html   Linguagem Html      Perl Cpfinder.pl -site www.exemplo.com -html", "\n";
	print "   -php    Linguagem PHP       Perl Cpfinder.pl -site www.exemplo.com -php", "\n";
	exit();
}

# Erro / Site nao especificado

unless($site){
	print "[!] Erro", "\n\n";
	print "   -ajuda   Chama a ajuda do script   Perl Cpfinder.pl -ajuda", "\n";
	exit();
}

# -asp / Escanear Asp

if($asp){
	print "[+] Asp - Cpanel", "\n\n";
	open(my $arquivo, '>', "resultado/asp-cpanel.txt") or die "[!] Impossivel de Criar ( resultado/asp-cpanel.txt )", "\n";
	open(FILE, "arquivos/adm-asp.Cpfinder") or die "[!] Arquivo ( arquivos/adm-asp.Cpfinder ) Nao Encontrado", "\n";
	my @path = "";
	my $final = "";
	my $ways = "";
	@path=(<FILE>);
	foreach $ways(@path){
		$final = "http://".$site."/".$ways;
		my $req=HTTP::Request->new(GET=>$final);
		my $ua=LWP::UserAgent->new();
		$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)');
		$ua->timeout(1);
		my $response=$ua->request($req);
		if($response->content =~ /Username/ || $response->content =~ /Password/ || $response->content =~ /username/ || $response->content =~ /password/ || $response->content =~ /USERNAME/ || $response->content =~ /PASSWORD/ || $response->content =~ /Senha/ || $response->content =~ /senha/ || $response->content =~ /Personal/ || $response->content =~ /Usuario/ || $response->content =~ /Clave/ || $response->content =~ /Usager/ || $response->content =~ /usager/ || $response->content =~ /Sing/ || $response->content =~ /passe/ || $response->content =~ /P\/W/ || $response->content =~ /Admin Password/) {
			print "   [+] ". $final, "\n";
			print $arquivo "[+] $final \n";
		}
			else
			{
				print "   [-] $final","\n";
			}
		}
	close($arquivo);
	print "\n", "[!] Resultado imprimido no Arquivo ( Resultado/asp-cpanel.txt)", "\n\n";
}

# -aspx / Escanear Aspx

if($aspx){
	print "[+] Aspx - Cpanel", "\n\n";
	open(my $arquivo, '>', "resultado/aspx-cpanel.txt") or die "[!] Impossivel de Criar ( resultado/aspx-cpanel.txt )", "\n";
	open(FILE, "arquivos/adm-aspx.Cpfinder") or die "[!] Arquivo ( arquivos/adm-asp.Cpfinder ) Nao Encontrado", "\n";
	my @path = "";
	my $final = "";
	my $ways = "";
	@path=(<FILE>);
	foreach $ways(@path){
		$final = "http://".$site."/".$ways;
		my $req=HTTP::Request->new(GET=>$final);
		my $ua=LWP::UserAgent->new();
		$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)');
		$ua->timeout(1);
		my $response=$ua->request($req);
		if($response->content =~ /Username/ || $response->content =~ /Password/ || $response->content =~ /username/ || $response->content =~ /password/ || $response->content =~ /USERNAME/ || $response->content =~ /PASSWORD/ || $response->content =~ /Senha/ || $response->content =~ /senha/ || $response->content =~ /Personal/ || $response->content =~ /Usuario/ || $response->content =~ /Clave/ || $response->content =~ /Usager/ || $response->content =~ /usager/ || $response->content =~ /Sing/ || $response->content =~ /passe/ || $response->content =~ /P\/W/ || $response->content =~ /Admin Password/) {
			print "   [+] ". $final, "\n";
			print $arquivo "[+] $final \n";
		}
			else
			{
				print "   [-] $final","\n";
			}
		}
	close($arquivo);
	print "\n", "[!] Resultado imprimido no Arquivo ( Resultado/aspx-cpanel.txt)", "\n\n";
}

# -cfm / Escanear Cfm

if($cfm){
	print "[+] Cfm - Cpanel", "\n\n";
	open(my $arquivo, '>', "resultado/cfm-cpanel.txt") or die "[!] Impossivel de Criar ( resultado/cfm-cpanel.txt )", "\n";
	open(FILE, "arquivos/adm-cfm.Cpfinder") or die "[!] Arquivo ( arquivos/adm-cfm.Cpfinder ) Nao Encontrado", "\n";
	my @path = "";
	my $final = "";
	my $ways = "";
	@path=(<FILE>);
	foreach $ways(@path){
		$final = "http://".$site."/".$ways;
		my $req=HTTP::Request->new(GET=>$final);
		my $ua=LWP::UserAgent->new();
		$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)');
		$ua->timeout(1);
		my $response=$ua->request($req);
		if($response->content =~ /Username/ || $response->content =~ /Password/ || $response->content =~ /username/ || $response->content =~ /password/ || $response->content =~ /USERNAME/ || $response->content =~ /PASSWORD/ || $response->content =~ /Senha/ || $response->content =~ /senha/ || $response->content =~ /Personal/ || $response->content =~ /Usuario/ || $response->content =~ /Clave/ || $response->content =~ /Usager/ || $response->content =~ /usager/ || $response->content =~ /Sing/ || $response->content =~ /passe/ || $response->content =~ /P\/W/ || $response->content =~ /Admin Password/) {
			print "   [+] ". $final, "\n";
			print $arquivo "[+] $final \n";
		}
			else
			{
				print "   [-] $final","\n";
			}
		}
	close($arquivo);
	print "\n", "[!] Resultado imprimido no Arquivo ( Resultado/cfm-cpanel.txt)", "\n\n";
}

# -html / Escanear html

if($html){
	print "[+] Html - Cpanel", "\n\n";
	open(my $arquivo, '>', "resultado/html-cpanel.txt") or die "[!] Impossivel de Criar ( resultado/html-cpanel.txt )", "\n";
	open(FILE, "arquivos/adm-html.Cpfinder") or die "[!] Arquivo ( arquivos/adm-html.Cpfinder ) Nao Encontrado", "\n";
	my @path = "";
	my $final = "";
	my $ways = "";
	@path=(<FILE>);
	foreach $ways(@path){
		$final = "http://".$site."/".$ways;
		my $req=HTTP::Request->new(GET=>$final);
		my $ua=LWP::UserAgent->new();
		$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)');
		$ua->timeout(1);
		my $response=$ua->request($req);
		if($response->content =~ /Username/ || $response->content =~ /Password/ || $response->content =~ /username/ || $response->content =~ /password/ || $response->content =~ /USERNAME/ || $response->content =~ /PASSWORD/ || $response->content =~ /Senha/ || $response->content =~ /senha/ || $response->content =~ /Personal/ || $response->content =~ /Usuario/ || $response->content =~ /Clave/ || $response->content =~ /Usager/ || $response->content =~ /usager/ || $response->content =~ /Sing/ || $response->content =~ /passe/ || $response->content =~ /P\/W/ || $response->content =~ /Admin Password/) {
			print "   [+] ". $final, "\n";
			print $arquivo "[+] $final \n";
		}
			else
			{
				print "   [-] $final","\n";
			}
		}
	close($arquivo);
	print "\n", "[!] Resultado imprimido no Arquivo ( Resultado/html-cpanel.txt)", "\n\n";
}

# -php / Escanear php

if($php){
	print "[+] PHP - Cpanel", "\n\n";
	open(my $arquivo, '>', "resultado/php-cpanel.txt") or die "[!] Impossivel de Criar ( resultado/php-cpanel.txt )", "\n";
	open(FILE, "arquivos/adm-php.Cpfinder") or die "[!] Arquivo ( arquivos/adm-php.Cpfinder ) Nao Encontrado", "\n";
	my @path = "";
	my $final = "";
	my $ways = "";
	@path=(<FILE>);
	foreach $ways(@path){
		$final = "http://".$site."/".$ways;
		my $req=HTTP::Request->new(GET=>$final);
		my $ua=LWP::UserAgent->new();
		$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)');
		$ua->timeout(1);
		my $response=$ua->request($req);
		if($response->content =~ /Username/ || $response->content =~ /Password/ || $response->content =~ /username/ || $response->content =~ /password/ || $response->content =~ /USERNAME/ || $response->content =~ /PASSWORD/ || $response->content =~ /Senha/ || $response->content =~ /senha/ || $response->content =~ /Personal/ || $response->content =~ /Usuario/ || $response->content =~ /Clave/ || $response->content =~ /Usager/ || $response->content =~ /usager/ || $response->content =~ /Sing/ || $response->content =~ /passe/ || $response->content =~ /P\/W/ || $response->content =~ /Admin Password/) {
			print "   [+] ". $final, "\n";
			print $arquivo "[+] $final \n";
		}
			else
			{
				print "   [-] $final","\n";
			}
		}
	close($arquivo);
	print "\n", "[!] Resultado imprimido no Arquivo ( Resultado/php-cpanel.txt)", "\n\n";
}

exit();