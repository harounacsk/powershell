

function TransformXml ($xmlFile) {
	$xml = New-Object XML
	$xml.Load($xmlFile)
	$nodes = $xml.SelectNodes("/book/*");

	$xmlDocument = New-Object System.Xml.XmlDocument
	$books = $xmlDocument.CreateElement("books")
	$xmlDocument.AppendChild($books)

	foreach ($node in $nodes) {
			if ($node.title -and $node.title.Contains('Chapitre')) {
					$book = $xmlDocument.CreateElement("book")
					$chapter = $xmlDocument.ImportNode($node, $true)
					$book.AppendChild($chapter)
					$books.AppendChild($book)
			}
			else {
					$chapter = $xmlDocument.ImportNode($node, $true)
					$book.AppendChild($chapter)
					$books.AppendChild($book)
			} 

	}
	$xmlDocument.Save("output.xml")
}