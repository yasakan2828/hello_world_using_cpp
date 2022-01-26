workspace "HelloWorld"
do
	startproject("Main")
	-- ビルドコンフィグレーションの構成
	configurations{ "Debug", "Release" }


	-- プログラミング言語
	language "C++"
	cppdialect "Default"

	-- マクロ
	filter "configurations:*Debug"
		defines{ "DEBUG" }

	-- コードの最適化
	filter "configurations:*Debug"
		optimize "Debug"
	filter "configurations:*Release"
		optimize "Full"

	-- デバッグ情報の生成
	filter "configurations:*Debug"
		symbols "On"
	filter "configurations:*Release"
		symbols "Off"
end

project "Main"
do
	-- プロジェクトが作成されるパス
	location "./Workspace/Main"

	-- 中間ディレクトリ
	objdir "$(ProjectDir)/Objects"

	-- アーキテクチャ
	architecture "x64"

	-- 構成
	kind "ConsoleApp"

	-- コンパイルしたプログラムの出力先
	targetdir("Bin")

	-- インクルードのディレクトリ
	includedirs {
		"Includes"
	}

	-- プロジェクトに含めるファイル
	files {
		"Includes/**.h",
		"Sources/**.cpp"
	}
end
