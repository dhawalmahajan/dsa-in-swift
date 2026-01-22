import Foundation

// Abstraction for document elements
protocol DocumentElement {
  func render() -> String
}

// PersistenceDocument abstraction
protocol PersistenceDocument {
  func save(data: String)
}
// Concrete implementation for text elements
class TextElement: DocumentElement {
  private let text: String

  init(text: String) {
    self.text = text
  }

  func render() -> String {
    return text
  }
}

// Concrete implementation for image elements
class ImageElement: DocumentElement {
  private let imagePath: String

  init(imagePath: String) {
    self.imagePath = imagePath
  }

  func render() -> String {
    return "[Image: \(imagePath)]"
  }
}

// NewLineElement represents a line break in the document
class NewLineElement: DocumentElement {
  func render() -> String {
    return "\n"
  }
}

// TabSpaceElement represents a tab space in the document
class TabSpaceElement: DocumentElement {
  func render() -> String {
    return "\t"
  }
}

// Document class responsible for holding a collection of elements
class Document {
  private var documentElements: [DocumentElement] = []

  func addElement(_ element: DocumentElement) {
    documentElements.append(element)
  }

  // Renders the document by concatenating the render output of all elements
  func render() -> String {
    var result = ""
    for element in documentElements {
      result += element.render()
    }
    return result
  }
}

// FileStorage implementation of PersistenceDocument
class FileStorage: PersistenceDocument {
  func save(data: String) {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      .appendingPathComponent("document.txt")

    do {
      try data.write(to: fileURL, atomically: true, encoding: .utf8)
      print("Document saved to \(fileURL.path)")
    } catch {
      print("Error: Unable to save file - \(error.localizedDescription)")
    }
  }
}

// Placeholder DBStorage implementation
class DBStorage: PersistenceDocument {
  func save(data: String) {
    // Save to DB
    print("Saving to database...")
  }
}

// DocumentEditor class managing client interactions
class DocumentEditor {
  private let document: Document
  private let storage: PersistenceDocument
  private var renderedDocument: String = ""

  init(document: Document, storage: PersistenceDocument) {
    self.document = document
    self.storage = storage
  }

  func addText(_ text: String) {
    document.addElement(TextElement(text: text))
  }

  func addImage(_ imagePath: String) {
    document.addElement(ImageElement(imagePath: imagePath))
  }

  // Adds a new line to the document
  func addNewLine() {
    document.addElement(NewLineElement())
  }

  // Adds a tab space to the document
  func addTabSpace() {
    document.addElement(TabSpaceElement())
  }

  func renderDocument() -> String {
    if renderedDocument.isEmpty {
      renderedDocument = document.render()
    }
    return renderedDocument
  }

  func saveDocument() {
    storage.save(data: renderDocument())
  }
}

func documentEditorExample() {
  let document = Document()
  let persistence: PersistenceDocument = FileStorage()
  let editor = DocumentEditor(document: document, storage: persistence)

  // Simulate a client using the editor
  editor.addText("Hello, world!")
  editor.addNewLine()
  editor.addText("This is a real-world document editor example.")
  editor.addNewLine()
  editor.addTabSpace()
  editor.addText("Indented text after a tab space.")
  editor.addNewLine()
  editor.addImage("picture.jpg")

  // Render and display the final document
  print(editor.renderDocument())
  editor.saveDocument()
}
