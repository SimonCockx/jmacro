{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_jmacro (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,6,17] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\bin"
libdir     = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\lib\\x86_64-windows-ghc-8.10.4\\jmacro-0.6.17-CY7d9NGyAQa6f7VEPhkx8d-jmacro"
dynlibdir  = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\lib\\x86_64-windows-ghc-8.10.4"
datadir    = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\share\\x86_64-windows-ghc-8.10.4\\jmacro-0.6.17"
libexecdir = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\libexec\\x86_64-windows-ghc-8.10.4\\jmacro-0.6.17"
sysconfdir = "C:\\Users\\Thesis\\Seafile\\Simon-Cockx-thesis\\static-template\\.stack-work\\install\\b11dee51\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "jmacro_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "jmacro_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "jmacro_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "jmacro_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "jmacro_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "jmacro_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
