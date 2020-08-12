import styled from "styled-components";
import { FaDropbox } from "react-icons/fa";

export const Container = styled.div`
  --padding-top: 100px;
  --padding-bottom: 120px;
  --heading-font-size: 32px;
  --content-width: 100%;

  &.blue {
    --bg-color: var(--color-primary);
    --text-color: var(--color-tertiary);
    --logo-color: var(--color-secondary);
  }

  &.beige {
    --bg-color: var(--color-secondary);
    --text-color: var(--color-quaternary);
    --logo-color: var(--color-primary);
  }

  &.white {
    --bg-color: var(--color-tertiary);
    --text-color: var(--color-quaternary);
    --logo-color: var(--color-blue);
  }

  &.black {
    --bg-color: var(--color-quaternary);
    --text-color: var(--color-tertiary);
    --logo-color: var(--color-blue);
  }

  &:first-child {
    --padding-top: 130px;
    --heading-font-size: 51px;

    @media (min-width: 1024px) {
      --content-width: 50%;
      --heading-font-size: 71px;
    }
  }

  position: relative;

  background: var(--bg-color);
`;

export const HeaderWrapper = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;

  /**
   * Quem faz a mágica acontecer!
   * o Clip vai "forçar" cada header ficar fixo no seu component pai. Pelo menos a aparência...
   * na verdade, o Clip oculta uma parte do elemento.
   * os 4 "auto" significa cada lado do rect (retângulo)
   */
  clip: rect(auto, auto, auto, auto);
`;

export const Header = styled.header`
  z-index: 3;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;

  display: flex;
  justify-content: space-between;

  max-width: 1440px;
  margin: 0 auto;
  padding: 16px 32px;

  background: var(--bg-color);

  > h1 {
    display: flex;
    align-items: center;

    > span {
      margin-left: 10px;

      font-size: 29px;

      color: var(--text-color);
    }
  }

  > button {
    background: none;
    border: none;
    outline: none;

    font-size: 16px;
    cursor: pointer;

    color: var(--text-color);

    &:hover,
    &:focus {
      text-decoration: underline;
    }
  }
`;

export const DropboxLogo = styled(FaDropbox)`
  width: 36px;
  height: 32px;
  fill: var(--logo-color);
`;

export const Content = styled.div`
  z-index: 2;
  position: relative;

  max-width: 1440px;
  margin: 0 auto;

  > h2 {
    max-width: var(--content-width);

    color: var(--logo-color);
    font-size: var(--heading-font-size);
  }

  > p {
    margin-top: 20px;

    font-size: 16px;
    max-width: var(--content-width);

    color: var(--text-color);
  }

  padding: var(--padding-top) 32px var(--padding-bottom);
`;
