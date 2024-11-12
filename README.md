# FindX

FindX is a powerful tool that uses Google Dorking techniques to help you find files and other content across the web. With its intuitive interface, you can easily select the file types you're looking for and generate a customized Google search query to find exactly what you need.

## Features

- **File Type Selection**: Choose from a wide range of file types, including documents, media files, archives, and more. Select multiple file types to refine your search.
- **Customizable Search**: The app generates a Google search query based on your file type selections and the search terms you provide, allowing you to precisely target the content you're looking for.
- **Responsive Design**: The app is designed to work seamlessly on both desktop and mobile devices, providing a consistent user experience across different screen sizes.
- **Intuitive Interface**: The clean and modern UI makes it easy to navigate and use the app, even for those new to Google Dorking.

## Usage

1. **Enter your search query**: Type in the keywords or terms you're looking for in the search bar.
2. **Select file types**: Choose the file types you want to include in your search by tapping on the corresponding options.
3. **Generate the search query**: Click the search button to generate the Google search query based on your selections.
4. **Copy and use the query**: Copy the generated search query and use it on Google to find the files and content you're looking for.

Here's an example of a sample output query:

```
("file_name" OR intitle:"file_name") (filetype:docx OR filetype:pdf OR filetype:log) -inurl:(jsp|pl|php|html|aspx|htm|cf|shtml)
```

This query will search for files with the name "file_name" or files with "file_name" in the title, and it will look for files in the .docx, .pdf, or .log formats, while excluding pages with the specified file extensions.

## Contributing

If you'd like to contribute to the FindX project, please feel free to submit issues, bug reports, or pull requests on the project's GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE).
