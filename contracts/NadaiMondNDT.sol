// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/KeeperCompatible.sol";

// Una vez el contrato se despliega tenemos que
// ejecutar la funcion safeMint con tu address
contract NadaiMondNDT is KeeperCompatibleInterface, ERC721, ERC721URIStorage  {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    //Estos valores sonn estaticos pero el NFT ira apuntando
    // a cualquier de estos valores a medida que va evolucionando
    string[] IpfsUri = [
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon2.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon3.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon4.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon5.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon6.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon7.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon8.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon9.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon10.json",
        "https://ipfs.io/ipfs/QmXFsra1G5YGUBFihBiJuU5QHN5H1ZeEAjroPtZT9mMMEH/NadaiMon11.json"
    ];

    uint interval;
    uint lastTimeStamp;

    constructor(uint _interval) ERC721("Nadai Mon", "dNDT") {
        interval = _interval;
        lastTimeStamp = block.timestamp;
    }

    function checkUpkeep(bytes calldata /* checkData */) external view override returns (bool upkeepNeeded, bytes memory /* performData */) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;        
    }

    function performUpkeep(bytes calldata /* performData */) external override  {        
        if ((block.timestamp - lastTimeStamp) > interval ) {
            lastTimeStamp = block.timestamp;

            uint counter = _tokenIdCounter.current();

            for (uint256 index = 0; index < counter; index++) {            
                if(NadaiMonLevel(index) < 11){
                    pympMyRide(index);
                    break;
                }                
            }            
        }        
    }

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);        
        _setTokenURI(tokenId, IpfsUri[0]);
    }

    function pympMyRide(uint256 _tokenId) public{
        require(NadaiMonLevel(_tokenId) < 11, "Maximo nivel alcanzado!");
        //if(NadaiMonLevel(_tokenId) >= 11) {return;}    

        // obtiene el valor actual de los NadaiMon y le suma 1
        uint256 newVal = NadaiMonLevel(_tokenId) + 1;
        // store the new URI
        string memory newUri = IpfsUri[newVal];
        //Update the URI
        _setTokenURI(_tokenId, newUri);
    }

    // helper functions
    //
    function NadaiMonLevel(uint256 _tokenId) public view returns(uint256){
        string memory _uri = tokenURI(_tokenId);

        uint result;
        
        for (uint256 index = 0; index < IpfsUri.length; index++) {            
            if(keccak256(abi.encodePacked(IpfsUri[index])) == keccak256(abi.encodePacked(_uri)))
                result = index;
        }
        return result;
    }

    // The following functions are overrides required by Solidity.
    //
    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}