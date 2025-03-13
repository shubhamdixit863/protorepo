gen-proto:
	@echo "Generating proto files"
	cd scanner_search_service && for protofile in *.proto; do \
		protoc --go_out=. --go-grpc_out=. $$protofile; \
	done
