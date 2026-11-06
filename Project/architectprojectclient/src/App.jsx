import React from 'react'
import './App.css'
import Header from './Component/Header/Header'
import Common from './Component/Common'

export default function App() {
  return (

    <div >
      <Header />
      <h1 className='text-3xl font-bold underline text-red-500'>App</h1>
      <Common />

    </div>
  )
}
