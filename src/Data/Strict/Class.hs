{-# LANGUAGE TypeFamilies #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Strict.Class
-- Copyright   :  (c) 2017 Daniel Mendler
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  Daniel Mendler <mail@daniel-mendler.de>
-- Stability   :  experimental
-- Portability :  portable
--
-- IsStrict isomorphism for conversion.
--
-----------------------------------------------------------------------------

module Data.Strict.Class (
  IsStrict(..),
  liftStrict
) where

class IsStrict s where
  type Lazy s
  fromStrict :: s -> Lazy s
  toStrict   :: Lazy s -> s

liftStrict :: IsStrict s => (Lazy s -> Lazy s) -> (s -> s)
liftStrict f = toStrict . f . fromStrict
