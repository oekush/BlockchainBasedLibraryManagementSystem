// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BookNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Book {
        string title;
        string author;
        string isbn;
    }

    mapping(uint256 => Book) private _books;

    constructor() ERC721("BookNFT", "BNFT") {}

    function mintBook(address recipient, string memory title, string memory author, string memory isbn) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _books[newItemId] = Book(title, author, isbn);

        return newItemId;
    }

    function getBook(uint256 tokenId) public view returns (string memory, string memory, string memory) {
        require(_exists(tokenId), "BookNFT: Book query for nonexistent token");
        Book memory book = _books[tokenId];
        return (book.title, book.author, book.isbn);
    }
}
