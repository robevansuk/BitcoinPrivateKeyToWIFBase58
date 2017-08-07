This software is for use at your own risk. I accept no liability for its use. It is free for anyone and everyone to download and use. There is a 3rd party dependency on the bitcoinj library which runs locally. All code is run locally to the best of my knowledge. It is up to you to ensure you maintain the privacy of your private keys.

# Bitcoin Private Key to WIF Base 58 Converter

## What's the purpose of this script/repository?

So on August 1st, 2017, bitcoin forked and "bitcoin cash" was born. To obtain your bitcoin cash you need to be able to get hold of your private keys. I deposited my bitcoin to a bitcoin.com wallet https://www.bitcoin.com/choose-your-wallet/bitcoin-com-wallet which exports a file labelled something like: *wallet.aes.json* which is not compatible with importing to your *wallet.dat* in the bitcoin/bitcoin cash client. Therefore I wrote the script to document the steps for how to obtain your bitcoin cash from a bitcoin.com wallet.

## Usage

Following the example for converting a private key in Hex format to WIF format http://en.bitcoin.it/wiki/Wallet_import_format. If you supply the private key from the example on the page: 0C28FCA386C7A227600B2FE50B7CAE11EC86D3BF1FBE471BE89827E19D72AA1
You should get the matching base58 encoded string displayed on the webpage linked to above. If you get something different or it doesn't work at all please raise an issue on the repository..

This code runs entirely on your machine and is provided free to anyone and everyone.

## Step by Step Guide to Claiming your Bitcoin Cash (BCC)

If you have a bitcoin.com wallet, you will be able to get your bitcoin cash by following these steps:

1. open your bitcoin.com wallet.
1. to get your private keys...
1. click Settings -> 
1. Personal Wallet (or the relevant label of the wallet) ->
1. More options ->
1. Export Wallet -> 
1. Provide a password ->
1. Download.

You should now be asked to save the wallet.aes.json (or equivalent) file to disk somewhere. USB Stick recommended. And make more than 1 copy on a separate USB stick/external storage... and then keep them SAFE. If your house burns down you don't want to lose your bitcoins. 

The wallet.aes.json is encrypted and password protected to prevent attackers gaining access to your bitcoin in the event they get hold of the file.

## Decrypting the wallet.aes.json file

1. Goto: https://bitwiseshiftleft.github.io/sjcl/demo/
1. copy the entire contents of the wallet.aes.json into the field 'Ciphertext'
1. enter your password.
1. click on the arrow labelled 'decrypt'
1. The "Plaintext" will now appear in the text area. Copy this - this will display your *unencrypted private key*.

## Importing your wallet into the wallet.dat file

1. Copy the wallet private key value from the field: *walletPrivKey*
1. `cd BitcoinPrivateKeyToWIFBase58` directory where `PrivateKeyToWif.sh` resides (in this project)
1. `./PrivateKeyToWif.sh ___your_private_key___`
1. copy the last line starting: `importprivkey ___your_private_key_in_WIF_format___ 'My BCC Wallet'`
1. navigate in your bitcoincash client to: Help -> Debug Window -> **Console**
1. unlock your current wallet using: `walletpassphrase ___your_wallet_passphrase_here___ 600` this will unlock your wallet for 10 mins. Hopefully you remember your wallet password. 
1. paste the command from the last line of the output (`importprivkey ___your_private_key_in_WIF_format___ 'BCC Wallet'`)

The client will then perform a "Rescanning" (which can take a long time). That should be it.

I'm not The Bitcoin Sign guy (https://www.coindesk.com/bitcoin-sign-guy-nets-almost-15000-fed-chair-appearance-goes-viral/) but certainly appreciate donations for my efforts:

* Bitcoin donations welcome: 16R7droo62cdg4SuMAxH1KfPHYCpTzBqHF
* Bitcoin cash donations also welcome: 16gkLgBgPkHE11zfysFUCYWczAfeqkaxh4

ENJOY!
