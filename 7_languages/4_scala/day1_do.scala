import scala.reflect._

class AssertException(msg: String) extends Exception(msg: String)

class Testing {
  def assertThrows[E](f: => Unit)(implicit eType: ClassTag[E]): Unit = {
    try{
    f
    } catch {
      case e: Exception =>
        if ( eType.runtimeClass.isAssignableFrom(e.getClass)) { return }
    }
    throw new AssertException("Expected error of type " + eType.runtimeClass.getName )
  }

  def assert(condition: Boolean, message: String): Unit = {
    if(!condition) { throw new AssertException(message) }
  }

  def assertNot(condition: Boolean, message: String): Unit = {
    assert(!condition, message)
  }
}

class InvalidCellException(cellValue: String) extends Exception("Invalid cell value: " + cellValue)

object Cell{
  val VALID_VALUES = Set("X", "O", " ")
}

class Cell(v: String){
  if( !Cell.VALID_VALUES(v) ) { 
    throw new InvalidCellException(v)
  }
  val value: String = v

  override def equals(other: Any): Boolean = other match {
    case other: Cell => this.value == other.value
    case _ => false
  }
}

class InputLine(s1: String, s2: String, s3: String) {
  def s1(): String = s1
  def s2(): String = s2
  def s3(): String = s3
}

class Line(s1: String, s2: String, s3: String) {
  val cells = List(new Cell(s1), new Cell(s2), new Cell(s3))
  def s1(): String = s1
  def s2(): String = s2
  def s3(): String = s3

  def this(input: InputLine) = {
    this(input.s1(), input.s1(), input.s1())
  }

  def isWinner(player: String): Boolean = {
    !cells.exists( c => c.value != player )
  }

  def hasSpaces():Boolean = {
    cells.exists( c => c.value == " " )
  }

  override def equals(other: Any):Boolean= other match {
    case other: Line => this.cells == other.cells
    case _ => false
  }
}

class InputBoard(l1: InputLine, l2: InputLine, l3: InputLine) {
  def l1(): InputLine = l1
  def l2(): InputLine = l2
  def l3(): InputLine = l3
}

class Board(l1: Line, l2: Line, l3: Line) {

  def this(input: InputBoard) = {
    this(new Line(input.l1()), new Line(input.l2()), new Line(input.l3()))
  }

  val rows = List(l1, l2, l3)

  val columns = List(
    new Line(l1.s1(), l2.s1(), l3.s1()),
    new Line(l1.s2(), l2.s2(), l3.s2()),
    new Line(l1.s3(), l2.s3(), l3.s3())
  )

  val diagonals = List(
    new Line(l1.s1(), l2.s2(), l3.s3()),
    new Line(l1.s3(), l2.s2(), l3.s1())
  )

  val lines = rows ++ columns ++ diagonals

  def isWinner(player: String):Boolean = {
    lines.exists( l => l.isWinner(player) )
  }

  def isFinished():Boolean = {
    ! lines.exists( l => l.hasSpaces() )
  }

  def isTie():Boolean = {
    isFinished() && !isWinner("X") && !isWinner("O")
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    val t = new Testing;
    // assert tests
    t.assertThrows[AssertException] { t.assert(1 > 2, "Maths don't work") }
    t.assert(1 <3 -1, "1 loves minus 1")

    // asertNot tests
    t.assertThrows[AssertException] { t.assertNot(1 < 2, "Maths still don't work") }
    t.assertNot( 2 <3 -1, "2 does (not) love -1")

    /* Cell tests */
    t.assertThrows[InvalidCellException] { new Cell("Foo") }
    t.assertThrows[InvalidCellException] { new Cell("") }
    t.assert(new Cell("X") == new Cell("X"), "Equality")
    t.assertNot( new Cell("X") == new Cell(" "), "NonEquality")

    /* Line tests */
    t.assertThrows[InvalidCellException] { new Line("Foo", "Bar", "Baz") }

    t.assert(    new Line("X", "X", "X").isWinner("X"), "X winner is calculated correctly" )
    t.assertNot( new Line("X", " ", "X").isWinner("X"), "X doesn't win this line" )
    t.assert(    new Line("O", "O", "O").isWinner("O"), "O winner is calculated correctly" )

    t.assertNot( new Line("X", "O", "X").hasSpaces()  , "hasSpaces returns false when there are no spaces")
    t.assert(    new Line(" ", "X", "O").hasSpaces()  , "hasSpaces returns true when there is 1 space" )
    t.assert(    new Line(" ", " ", "O").hasSpaces()  , "hasSpaces returns true when there are 2 spaces" )

    t.assert(    new Line("X", " ", "O") == new Line("X", " ", "O"), "Equality" )
    t.assertNot( new Line("X", "X", "X") == new Line("O", "O", "O"), "Non equality" )


    /* Board tests */
    val inputBoard = new Board(new Line("X","O","X"), new Line("O"," ","X"), new Line("O","X","O"))
    val rows =      List(new Line("X","O","X"), new Line("O"," ","X"), new Line("O","X","O"))
    val columns =   List(new Line("X","O","O"), new Line("O"," ","X"), new Line("X","X","O"))
    val diagonals = List(new Line("X"," ","O"), new Line("X"," ","O"))

    t.assert( inputBoard.rows == rows, "rows" )
    t.assert( inputBoard.columns == columns,  "columns")
    t.assert( inputBoard.diagonals == diagonals, "diagonals")
    t.assert( inputBoard.lines == rows ++ columns ++ diagonals, "lines")


    val xWinsByRows = new Board(new Line("X","X","X"), new Line(" "," ","O"), new Line("O"," ","O"))
    t.assert(                                            xWinsByRows.isWinner("X"), "X wins by rows" )
    t.assert( new Board(new Line("X"," ","O"), new Line("X"," ","O"), new Line("X","O"," ")).isWinner("X"), "X wins by columns" )
    t.assert( new Board(new Line("X","O","O"), new Line(" ","X","O"), new Line(" "," ","X")).isWinner("X"), "X wins by diagonals" )


    val oWinsByRows = new Board(new Line("X","X"," "), new Line(" "," ","X"), new Line("O","O","O"))
    t.assert(                                            oWinsByRows.isWinner("O"), "O wins by rows" )
    t.assert( new Board(new Line("X"," ","O"), new Line("X"," ","O"), new Line(" ","X","O")).isWinner("O"), "O wins by columns" )
    t.assert( new Board(new Line("X"," ","O"), new Line(" ","O","X"), new Line("O"," ","X")).isWinner("O"), "O wins by diagonals" )

    val tieBoard = new Board(new Line("X","X","O"),
                             new Line("O","O","X"),
                             new Line("X","O","O"))

    t.assert(    tieBoard.isFinished(), "finished")
    t.assertNot( inputBoard.isFinished(), "not finished")

    t.assert(    tieBoard.isTie(),  "Tie")
    t.assertNot( inputBoard.isTie(), "Not tie when not finished")
    t.assertNot( xWinsByRows.isTie(), "Not tie when one of the players wins")
  }
}