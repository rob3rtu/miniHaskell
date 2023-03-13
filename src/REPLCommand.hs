
module REPLCommand where

import Text.Parsec.String (Parser)
import Text.Parsec.Language (emptyDef, LanguageDef)
import Text.Parsec.Token
import Text.Parsec (anyChar)
import Control.Applicative (many, (<|>))

data REPLCommand
  = Quit
  | Load String
  | Eval String

replDef :: LanguageDef st
replDef = emptyDef {
    reservedNames = [":load", ":quit"],
    reservedOpNames = [":l", ":q"]
}

repl :: TokenParser st
repl = makeTokenParser replDef

replQuit :: Parser REPLCommand
replQuit = pure Quit <$> (((reservedOp repl) ":q") <|> ((reserved repl) ":quit"))

replCommand :: Parser REPLCommand
replCommand = undefined

