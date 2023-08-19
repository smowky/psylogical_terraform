Jak na secrets
Pokud jsou soucasti envu zasifrovane secrets, je potreba si z password manageru
vytahnout vault_pass (do rootu repozitare) a potrebne secrets desifrovat do noveho
souboru. Napriklad prikazem
`ansible-vault view --vault-password-file=vault_pass do/environment/variables_secret > do/environment/variables_secret.auto.tfvars`
pokud stojite v rootu repozitare.
Novy soubor se automaticky nacte s ostatnimi pri spusteni terraformu a je gitignored, takze se da normalne
commitovat zmeny.

