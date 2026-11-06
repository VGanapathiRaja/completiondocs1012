import React from 'react'

export default function Header() {
    return (
        <div>
            <nav className="bg-slate-900 text-white px-6 py-4">
                <div className="max-w-7xl mx-auto flex items-center justify-between">

                    {/* Logo */}
                    <h1 className="text-2xl font-bold text-blue-400">
                        MyWebsite
                    </h1>

                    {/* Navigation Links */}
                    <ul className="flex items-center gap-8">
                        <li>
                            <a href="/" className="hover:text-blue-400">
                                Home
                            </a>
                        </li>

                        <li>
                            <a href="/about" className="hover:text-blue-400">
                                About
                            </a>
                        </li>

                        <li>
                            <a href="/services" className="hover:text-blue-400">
                                Services
                            </a>
                        </li>

                        <li>
                            <a href="/contact" className="hover:text-blue-400">
                                Contact
                            </a>
                        </li>
                    </ul>

                    {/* Button */}
                    <button className="bg-blue-500 hover:bg-blue-600 px-5 py-2 rounded-lg">
                        Get Started
                    </button>

                </div>
            </nav>
        </div>
    )
}
