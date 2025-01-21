# Phony targets
.PHONY: build clean test deploy install

install:
	@echo "Installing dependencies..."
	yarn

# Compilation of contracts
build:
	@echo "Compiling contracts..."
	forge build

# Clean compiled artifacts
clean:
	@echo "Cleaning up..."
	forge clean

##################################################################################
##################################  DEPLOYMENT  ##################################
##################################################################################



########################################## CORE DEPLOYMENTS ##########################################
script-upgrade:
	@echo "Upgrade proxy contract on $(NETWORK)..."
	forge script script/deploy/UpgradeBlueChip.s.sol --rpc-url $(NETWORK)

script-withdraw:
	forge script script/deploy/WithdrawToReceiver.s.sol --rpc-url $(NETWORK)