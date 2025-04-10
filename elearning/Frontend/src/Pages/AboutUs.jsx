import React from 'react'
import { Link } from "react-router-dom";
import elearning from "../../assets/elearning1.jpg";
import learningPic from "../../assets/elearning2.avif";
import { Button } from "@/components/ui/button"
import { useTranslation } from 'react-i18next';


const AboutUs = () => {
  const { t } = useTranslation();

  const {
    aboutUs,
    
    
    
  } = t("Home", { returnObjects: true });
  return (
    <>
        <div className="bg-pale h-[250px] flex items-center justify-center">
          <div className="text-center">
              <h1 className="text-[25px] font-bold text-heading animate__animated animate__fadeInDown">{aboutUs.title}</h1>
              <div className='flex flex-row gap-2'>
                  <Link to="/">Home</Link>
                  <p>/</p>
                  <p>About Us</p>
              </div>
          </div>
        </div>

        <div className="w-full h-[400px]">
          <div className="w-[90%] mx-auto h-full flex flex-col-reverse lg:flex-row justify-between items-center gap-8">
            {/* Text Section */}
            <div className="w-full lg:w-1/2 flex flex-col justify-center items-center text-center lg:text-left animate__animated animate__fadeInLeft">
              <h1 className="text-xl md:text-xl font-bold mb-4 text-black">
              {aboutUs.unlockYourPotential}
              </h1>
              <p className="text-base w-[90%] lg:w-3/4 mx-auto lg:mx-0 mb-6 text-gray-700">
              {aboutUs.description}
              </p>
            </div>

            {/* Image Section */}
            <div className="lg:w-1/2 flex justify-center items-center animate__animated animate__bounceInRight">
              <img 
                src={elearning} 
                alt="E-learning Illustration" 
                className="w-64 md:w-80 lg:w-[400px] rounded-xl shadow-xl"
              />
            </div>
          </div>
        </div>

        <div className="w-full h-[400px]">
          <div className="w-[90%] mx-auto h-full flex flex-col lg:flex-row justify-between items-center gap-8">
            {/* Image Section */}
            <div className="lg:w-1/2 flex justify-center items-center animate__animated animate__bounceInLeft">
              <img 
                src={learningPic} 
                alt="E-learning Illustration" 
                className="w-64 md:w-80 lg:w-[400px] rounded-xl shadow-xl"
              />
            </div>

            {/* Text Section */}
            <div className="w-full lg:w-1/2 flex flex-col justify-center items-center text-center lg:text-left animate__animated animate__fadeInRight">
              <h1 className="text-xl font-bold mb-4 text-black">
              {aboutUs.ourMission}
              </h1>
              <p className="text-base w-[90%] lg:w-3/4 mx-auto lg:mx-0 mb-6 text-gray-700">
              {aboutUs.missionDescription}
              </p>
            </div>
          </div>
        </div>

        <div className="h-[250px] flex items-center justify-center">
          <div className="text-center">
              <h1 className="text-xl font-bold pb-8 text-heading animate__animated animate__fadeInUp">{aboutUs.journeyMessage}</h1>
              <Link to="/user/explore_courses">
                <Button className="bg-customGreen text-md">{aboutUs.startLearningButton}</Button>
              </Link>
          </div>
        </div>

    </>
  )
}

export default AboutUs;